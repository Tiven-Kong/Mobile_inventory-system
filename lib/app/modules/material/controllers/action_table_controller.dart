import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vuthy_mobile/app/modules/material/views/update_view.dart';

import '../views/viewmaterial_view.dart';
import 'material_controller.dart';
class ActionTableController extends GetxController {
  ActionTableController({ this.materailData});
  
  final dynamic materailData;
  final MaterialController  controller = Get.put(MaterialController()) ;

  Rx<IconData?> selectedIcon = Rx<IconData?>(null);

  List<IconData> iconOptions = [
    Icons.remove_red_eye,
    Icons.edit,
    Icons.delete,
  ];

  void changeIcon(IconData newIcon, dynamic materailData) {
    selectedIcon.value = newIcon;

    if (newIcon == Icons.remove_red_eye) {
      Get.to(() => MarterialView_id(itemData: materailData)); // Pass the correct data
    }
    if(newIcon == Icons.delete){
     controller.delete(materailData.id);
    }
    if(newIcon == Icons.edit){
      Get.to(()=>UpdateView(data:materailData));
    }
    // if(newIcon == Icons.)
  }
}
