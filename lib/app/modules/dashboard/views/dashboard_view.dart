import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vuthy_mobile/app/modules/dashboard/views/widget/card_widget.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
   DashboardView({super.key});
   final DashboardController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardView'),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height/2,
              width: Get.width,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.materail_StockSummary.length,
                itemBuilder: (context , index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Raw Materail Stock Summary" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                     DashBoardCard(icons: Icons.monetization_on_rounded, value:"${controller.materail_StockSummary[index].currentStockValueInUsd}" , text:"Value Value In USD"),
                      DashBoardCard(icons:  Icons.monetization_on_rounded, value:"${controller.materail_StockSummary[index].currentStockValueInRiel}" , text:"Value Value In Riel"),
                      DashBoardCard(icons: Icons.arrow_circle_up_sharp, value:"${controller.materail_StockSummary[index].rawMaterialCount}" , text:"NO. of Raw Materail"),
                      DashBoardCard(icons: Icons.money, value:"${controller.materail_StockSummary[index].rawMaterialScrapCount}" , text:"NO. of Materail Scrap"),
        
                    ],
                  );
                },
        
              ),
            ),
        
            SizedBox(
              height: 700,
              width: Get.width,
              child: ListView.builder(
                physics:NeverScrollableScrollPhysics(),
                itemCount: controller.product_StockSummary.length,
                itemBuilder: (context , index){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Raw Materail Stock Summary" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                      DashBoardCard(icons: Icons.monetization_on_rounded, value:"${controller.product_StockSummary[index].currentStockValueInUsd}" , text:"Value Value In USD"),
                      DashBoardCard(icons:  Icons.monetization_on_rounded, value:"${controller.product_StockSummary[index].currentStockValueInRiel}" , text:"Value Value In Riel"),
                      DashBoardCard(icons: Icons.arrow_circle_up_sharp, value:"${controller.product_StockSummary[index].productCount}" , text:"NO. of Raw Materail"),
                      DashBoardCard(icons: Icons.money, value:"${controller.product_StockSummary[index].productScrapCount}" , text:"NO. of Materail Scrap"),
        
                    ],
                  );
                },
        
              ),
            ),
        
          ],
        ),
      )
    );
  }
}
