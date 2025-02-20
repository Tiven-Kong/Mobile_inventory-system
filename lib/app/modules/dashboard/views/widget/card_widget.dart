import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vuthy_mobile/app/theme/colors_theme.dart';
import 'package:vuthy_mobile/app/widget/title_text.dart';

import '../../../../widget/card_text.dart';

class DashBoardCard extends StatelessWidget {
  DashBoardCard(
      {super.key,
      required this.image,
      required this.value,
      required this.text,
      required this.colors});

  final String image;
  final String text;
  final String value;
  final Color colors  ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          SizedBox(
            height: Get.height / 9,
            width: Get.width/1.09,
            child: Card(
              elevation: 6,
              color: AppColors.primarycolor, // Set background color to red
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: Get.height / 40,
                    child: Image.asset(image , width: 60 , height: 55,),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CardText(text: text),
                        CardText(text: value),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
