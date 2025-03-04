import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../widget/normal_text.dart';
import '../../../../widget/normal_text_inbackground.dart';
import '../../../../widget/title_inbackground.dart';


class ViewAction extends StatelessWidget {
   ViewAction({super.key ,  required this.tittle , required this.information});
  String information  ;
  String tittle ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft  ,
              child: NBtext(text: tittle)) ,
          SizedBox(height: 10,),
          Container(
            width: Get.width,
            height:40 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              color: Colors.white ,
              border: Border.all(width: 0.5 , color: Colors.black)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: NBtext( text: information,)),
            ),
          ),
        ],
      ),
    );
  }
}
