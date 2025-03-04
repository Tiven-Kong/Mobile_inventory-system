import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vuthy_mobile/app/data/provider/login_provider.dart';
import 'package:vuthy_mobile/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  final _apiProvider = Get.find<ApiProvider>();
  RxList getUserInformation = [].obs ;

  Future<int> login({required String email, required String password}) async {
    try {
      final response = await _apiProvider.login(email: email, password: password);


      if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
        final data = response.data;
        if (data['authorisation'] != null && data['authorisation']['token'] != null) {
          String newToken = data['authorisation']['token'];
          box.write('token', newToken);
          Get.offAllNamed(Routes.MATERIAL);
         return response.statusCode! ;
        }
        // if(data['user']!=null){
        //     final List<dynamic> dataList = data['user'] ?? [];
        //     getUserInformation.value = dataList.toList();
        //
        //   }

        }


      // If login fails, throw an exception
      throw Exception("Invalid credentials");

    } catch (e) {
      Get.back(); // Close the loading dialog in case of failure
      throw Exception("Login error: $e");
    }
  }

}
