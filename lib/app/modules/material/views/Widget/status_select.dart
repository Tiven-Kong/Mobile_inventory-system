import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/material_status_controller.dart';

class DropdownExample extends StatelessWidget {
  final Material_StatusController controller = Get.put(Material_StatusController());

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Obx(
              () =>
              DropdownButton<String>(
                value: controller.selectedValue.value.isNotEmpty
                    ? controller.selectedValue.value
                    : 'SelectStatus',

                onChanged: (newValue) {
                  if (newValue != null) {

                    controller.selectedValue.value = newValue;
                    controller.displayStatus.value = true ;
                    controller.fetchMaterial_Status();
                    if(newValue =="SelectStatus"){
                      controller.displayStatus.value = false ;
                    }


                  }
                },
                items: [
                  'SelectStatus',
                  'IN_STOCK',
                  'LOW_STOCK',
                  'OUT_STOCK',

                ]
                    .map((option) =>
                    DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ))
                    .toList(),
              ),
        ),
      );
  }
  }

