

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../../Model/MaterailModel/Materail.dart';
import '../../login/controllers/login_provider.dart';


class Material_StatusController extends GetxController {
  RxList materials_status = <Data>[].obs;
  RxBool isLoading = true.obs;
  final dio = Dio();
  final selectedValue = ''.obs;
  final pageStatue = 1.obs ;
  final LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
    fetchMaterial();
  }


  Future<void> fetchMaterial({int retryCount = 0}) async {

    try {
      isLoading(true);
      final response = await dio.get(
        'https://ims-api.bananacentercambodia.com/api/raw-materials?page=1&filter[status]=IN_STOCK',
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
          materials_status.value = dataList.map((item) => Data.fromJson(item)).toList();
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

  void changePage(int newPage) {
    pageStatue.value = newPage;
    fetchMaterial();
  }


}
