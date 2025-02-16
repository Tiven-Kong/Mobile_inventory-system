import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'material_controller.dart';

class SwitchView extends StatelessWidget {
  SwitchView({super.key});
  final MaterialController controller = Get.put(MaterialController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      if (controller.search.isNotEmpty && controller.page.value != 1) {

       // set defaul when have some search it will by default is in page 1
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.page.value=1; //kom oy vea nv ta 1 just change the value of page
        });
      }

      return SizedBox(
        child:controller.materials.value.isEmpty
            ?Container():
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            
            IconButton(
                onPressed: () {
                  if (controller.page.value >= 2) {
                    controller.changePage(controller.page.value - 1);
                  } else {
                    if(controller.search.isNotEmpty){
                      controller.changePage(1);
                    }
                    else{controller.changePage(6);}
                  }
                },
                icon: controller.materials.value.length<10 && controller.search.value.isNotEmpty&&controller.materials.value.isEmpty?Container():CircleAvatar(
                    backgroundColor: Colors.grey,


                    child: Icon(Icons.arrow_back))),
            Row(
              children: List.generate(6, (index) {
                int number = index + 1;

                if (controller.search.isEmpty) {
                  return GestureDetector(
                    onTap: () => controller.changePage(number),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        width: 30,
                        height: 35,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: controller.page.value == number
                              ? Colors.red
                              : Colors.lightBlueAccent,
                        ),
                        child: Center(
                          child: Text(
                            "$number",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }),
            ),
            IconButton(
                onPressed: () {

                 if (controller.page.value <= 5) {
                    controller.changePage(controller.page.value + 1);
                  } else {
                    controller.changePage(1);
                  }
                },
                icon:controller.materials.value.length<10&&controller.search.value.isNotEmpty?Container(): CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.arrow_forward)))
          ],
        ),
      );
    });
  }
}
