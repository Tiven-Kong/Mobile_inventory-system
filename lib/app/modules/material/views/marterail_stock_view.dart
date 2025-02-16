import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vuthy_mobile/app/modules/material/views/Widget/CardMarterail.dart';
import '../controllers/material_controller.dart';
import '../controllers/rawmaterail_stock.dart';
class MaterialStockView extends StatelessWidget {
  MaterialStockView({super.key});

  final MaterialStockController controller = Get.put(MaterialStockController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        if (controller.materialStockItems.isEmpty) {
          return Center(child: Text("No items available", style: TextStyle(fontSize: 20, color: Colors.grey)));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Row(
                    children: [
                     Card_marterail(icon_marterail: Icons.monetization_on_rounded, tittle: "Stock Value In USD", value: controller.materialStockItems[0].rawMaterialCount.toString()) ,
                      SizedBox(width: 15,),
                      Card_marterail(icon_marterail: Icons.monetization_on_rounded, tittle: "Stock Value In USD", value: controller.materialStockItems[0].rawMaterialCount.toString()) ,

                    ],
                  ),
                ) ,
                SizedBox(height: 20,),
                Row(
                  children: [
                    Card_marterail(icon_marterail: Icons.monetization_on_rounded, tittle: "Stock Value In USD", value: controller.materialStockItems[0].rawMaterialCount.toString()) ,
                    SizedBox(width: 15,),
                    Card_marterail(icon_marterail: Icons.monetization_on_rounded, tittle: "Stock Value In USD", value: controller.materialStockItems[0].rawMaterialCount.toString()) ,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
