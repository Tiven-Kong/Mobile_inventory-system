
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../../Model/MaterailModel/Materail.dart';
import '../../login/controllers/login_provider.dart';


class MaterialController extends GetxController {
  RxList<Data> materials = <Data>[].obs;

  RxBool isLoading = true.obs;
  final dio = Dio();
  final page = 1.obs;
  final search = "".obs;
  final LoginController controller = Get.find<LoginController>();


  @override
  void onInit() {
    super.onInit();
    fetchMaterial();

    //fetchMaterial again when have serach change value
    debounce(search, (_) => fetchMaterial(), time: Duration(milliseconds: 500));
  }


  Future<void> fetchMaterial({int retryCount = 0}) async {

    try {
      isLoading(true);
      final response = await dio.get(
        'https://ims-api.bananacentercambodia.com/api/raw-materials?page=${page.value}&filter[search]=${search.value}',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${controller.box.read('token')}',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        retryCount = 0;
        final responseData = response.data;
        if (responseData != null && responseData.isNotEmpty) {
          final List<dynamic> dataList = responseData['data'] ?? [];
          materials.value = dataList.map((item) => Data.fromJson(item)).toList();

        } else {
          print('Response data is empty');
        }


      }
      // Prevent more Retry
      else if (response.statusCode == 429) {
        if (retryCount < 3) {
          // delaytoRequest to the API
          final int delaySeconds = (2 * (retryCount + 1));
          print('Rate limited (429). Retrying in $delaySeconds seconds...');
          await Future.delayed(Duration(seconds: delaySeconds));
          // prevent from
          await fetchMaterial(retryCount: retryCount + 1);
        } else {
          print('Max retries reached. Please wait before trying again.');
        }
      }
      else {
        print('Failed to load materials: ${response.statusCode}');
      }
    }
    catch (e) {
      print('Error fetching materials: $e');
    }
    finally {
      isLoading(false); // Stop loading
    }
  }

//delete

  Future<void> delete(int id) async {
    final response = await dio.delete(
      'https://ims-api.bananacentercambodia.com/api/raw-material/$id',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${controller.box.read('token')}',
        },
      ),
    );

    if (response.statusCode == 200) {
      fetchMaterial() ;
      print('Deleted successfully');
    } else {
      print('Failed to delete: ${response.statusCode}');
    }
  }





  void changePage(int newPage) {
    page.value = newPage;
    fetchMaterial();
  }

  void S_each(String _Text) {
    search.value = _Text;
    fetchMaterial();
  }


}
