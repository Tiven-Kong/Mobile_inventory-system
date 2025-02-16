import 'package:flutter/material.dart';

import 'material_view.dart';


class MarterialView_id extends StatelessWidget {
   MarterialView_id({super.key , required this.itemData});
  var itemData ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text(itemData.name),
          Text(itemData.name)


        ],
      ),
    );
  }
}
