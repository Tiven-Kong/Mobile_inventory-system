import 'package:get/get.dart';

import '../controllers/material_controller.dart';


class MaterialBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the controller
    Get.lazyPut(() => MaterialController());
  }
}
