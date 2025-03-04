import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vuthy_mobile/app/theme/colors_theme.dart';
import 'package:vuthy_mobile/app/widget/title_text.dart';

import '../../dashboard/views/widget/card_widget.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductView'),
        centerTitle: true,
      ),
      body:Column(
        children: [
           Align(
               alignment: Alignment.topLeft,
               child: Ttext(text: 'Product Stock Summary')),
          DashBoardCard(image:'assets/logo/dollar.png' , value: '444', text: 'Stock Value in USD ', colors: AppColors.primarycolor) ,
          DashBoardCard(image:'assets/image/riel.png' , value: '444', text: 'Stock Value in R ', colors: AppColors.primarycolor) ,
          DashBoardCard(image:'assets/logo/dollar.png' , value: '444', text: 'NO. of Products ', colors: AppColors.primarycolor) ,
          DashBoardCard(image:'assets/image/riel.png' , value: '444', text: 'No. of Product Scrap', colors: AppColors.primarycolor) ,

        ],
      )
    );
  }
}
