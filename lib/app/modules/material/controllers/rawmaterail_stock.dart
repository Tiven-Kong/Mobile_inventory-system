import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Model/MaterailModel/MarterailStock.dart';
import '../../login/controllers/login_provider.dart';

class  MaterialStockController extends GetxController {
  RxBool isLoading = true.obs;
  final dio = Dio();
  final LoginController controller = Get.put(LoginController());
  RxList<MaterialModel> materialStockItems = <MaterialModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchMaterialData();
  }
  // Function to fetch material data
  Future<void> fetchMaterialData() async {
    try {
      isLoading(true); // Set loading state to true before making the API request

      final response = await dio.get(
        'https://ims-api.bananacentercambodia.com/api/kpi/raw-material-count',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${controller.box.read('token')}',
          },
        ),
      );

      // Check if the response is successful
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        if (responseData != null) {

          materialStockItems.value = [
            MaterialModel.fromJson(responseData)
          ];
        } else {
          print('Response data is empty');
        }
      } else {
        print('Failed to load materials: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any errors during the request
      print('Error occurred: $e');
    } finally {
      isLoading(false); // Set loading state to false after the API request is completed
    }
  }
}
