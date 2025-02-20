import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:vuthy_mobile/Model/productStockModel/product_stockModel.dart';
import '../../../../Model/MaterailModel/MarterailStock.dart';
import '../../../../Model/MaterailModel/Materail.dart';
import '../../login/controllers/login_provider.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxList <MaterialStockModel>materail_StockSummary = <MaterialStockModel>[].obs;
  RxList<ProdcutStockModel>product_StockSummary  = <ProdcutStockModel>[].obs;
  RxBool isLoading = true.obs;
  final dio = Dio();
  final LoginController controller = Get.put(LoginController());

  @override
  void onInit() {
    super.onInit();
    fetch_materail_StockSummary();
    fetch_product_Summary() ;
  }


  Future<void> fetch_materail_StockSummary() async {

    try {
      isLoading(true);
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        if (responseData != null && responseData.isNotEmpty) {
          materail_StockSummary.value = [
            MaterialStockModel.fromJson(responseData)
          ];
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


  Future<void>fetch_product_Summary() async {

    try {
      isLoading(true);
      final response = await dio.get(
        'https://ims-api.bananacentercambodia.com/api/kpi/product-count',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${controller.box.read('token')}',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        if (responseData != null && responseData.isNotEmpty) {
          product_StockSummary.value = [
            ProdcutStockModel.fromJson(responseData)
          ];
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
