import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vuthy_mobile/app/modules/Appbar/views/drawer.dart';
import 'package:vuthy_mobile/app/modules/dashboard/views/widget/card_widget.dart';
import '../../../widget/title_text.dart';
import '../../Appbar/views/appbar_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
   DashboardView({super.key});
   final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: AppbarView(),
          // You can optionally keep the AppBar title here or in AppbarView()
        ),
      drawer: widgetDrawer(),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10 , right: 10),
          child: Column(
            children: [
              SizedBox(
                height: Get.height/1.9,
                width: Get.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.materail_StockSummary.length,
                  itemBuilder: (context , index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Ttext(text: "Raw Material Stock Summary"),
                       SizedBox(height:8,),
                       DashBoardCard(image: "assets/logo/dollar.png", value:"${controller.materail_StockSummary[index].currentStockValueInUsd}" , text:"Value Value In USD", colors:Colors.yellowAccent,),
                        SizedBox(height:8,),
                        DashBoardCard(image: "assets/image/riel.png", value:"${controller.materail_StockSummary[index].currentStockValueInRiel}" , text:"Value Value In Riel" , colors: Colors.yellow,),
                        SizedBox(height:8,),
                        DashBoardCard(image: "assets/logo/dollar.png", value:"${controller.materail_StockSummary[index].rawMaterialCount}" , text:"NO. of Raw Materail" , colors: Colors.green,),
                        SizedBox(height:8,),
                        DashBoardCard(image: "assets/logo/dollar.png", value:"${controller.materail_StockSummary[index].rawMaterialScrapCount}" , text:"NO. of Materail Scrap"  , colors: Colors.green),

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
                        SizedBox(height:8,),
                        Ttext(text: "Raw Materail Stock Summary"),
                        SizedBox(height:8,),
                        DashBoardCard(image: "assets/logo/dollar.png", value:"${controller.product_StockSummary[index].currentStockValueInUsd}" , text:"Value Value In USD" ,colors: Colors.yellow),
                        SizedBox(height:8,),
                        DashBoardCard(image: "assets/image/riel.png", value:"${controller.product_StockSummary[index].currentStockValueInRiel}" , text:"Value Value In Riel" ,colors: Colors.yellow),
                        SizedBox(height:8,),
                        DashBoardCard(image: "assets/logo/dollar.png", value:"${controller.product_StockSummary[index].productCount}" , text:"NO. of Raw Materail" ,colors: Colors.green),
                        SizedBox(height:8,),
                        DashBoardCard(image: "assets/logo/dollar.png", value:"${controller.product_StockSummary[index].productScrapCount}" , text:"NO. of Materail Scrap" ,colors: Colors.green),

                      ],
                    );
                  },

                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}
