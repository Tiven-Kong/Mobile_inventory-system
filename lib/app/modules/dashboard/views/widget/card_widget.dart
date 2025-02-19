import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardCard extends StatelessWidget {
  DashBoardCard({super.key, required this.icons, required this.value, required this.text});

  final IconData icons;
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height / 9,
          width: Get.width,
          child: Card(
            color: Colors.blue, // Set background color to red
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: Get.height / 25,
                  child: Icon(icons, size: 30 , ),
                ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(color: Colors.white, fontSize: 18), // Adjust text style as needed
                      ),
                      Text(
                        value.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
