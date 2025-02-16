import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Card_marterail extends StatelessWidget {
   Card_marterail({super.key , required this.icon_marterail , required this.tittle , required this.value});
final IconData icon_marterail ;
final String tittle ;
final String value ;
  @override
  Widget build(BuildContext context) {
    return   Container(
      width:Get.width/2.2
      ,
      height: 80,
      decoration: BoxDecoration(color: Colors.yellow[200] , borderRadius: BorderRadius.circular(20)),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon_marterail, color: Colors.greenAccent,size: 40,),
          SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tittle) ,
                Text(value) ,
              ],
            ),
          )
        ],
      ),
    );
  }
}
