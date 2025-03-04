import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/bindings/api_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/text_theme.dart';


Future<void> main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(

      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    title: "Application",
      initialBinding: ApiBinding(),  // Bind ApiProvider
      initialRoute: AppPages.INITIAL,  // Set initial route
      getPages: AppPages.routes,  // Define the routes
    ),
  );
}
