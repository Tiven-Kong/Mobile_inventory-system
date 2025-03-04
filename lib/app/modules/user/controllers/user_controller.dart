import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../Model/UserModel/User.dart';
import '../../login/controllers/login_provider.dart';



class UserController extends GetxController{



  RxBool isLoading = true.obs;
  final dio = Dio();
  final LoginController controller = Get.put(LoginController());
  RxList<Data> UserList = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetch_userInformation() ;

  }


  Future<void> fetch_userInformation() async {

    try {
      isLoading(true);
      final response = await dio.get(
        'https://ims-api.bananacentercambodia.com/api/users',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${controller.box.read('token')}',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode) ;
        final responseData = response.data;
        if (responseData != null && responseData.isNotEmpty) {
          final List<dynamic> user_List = responseData['data'] ?? [];
          UserList.value = user_List.map((item) => Data.fromJson(item)).toList();

        } else {
          print('Response data is empty');
        }


      }
      // Prevent more Retr
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


}
