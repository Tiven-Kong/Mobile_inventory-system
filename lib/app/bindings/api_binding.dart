import 'package:get/get.dart';
import 'package:vuthy_mobile/app/data/provider/login_provider.dart';

import '../modules/material/controllers/material_controller.dart';

class ApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider(), permanent: true);

  }
}
