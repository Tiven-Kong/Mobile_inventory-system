import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vuthy_mobile/app/theme/colors_theme.dart';

import '../../../widget/normal_text.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../dashboard/views/dashboard_view.dart';

class widgetDrawer extends StatelessWidget {
    widgetDrawer({super.key});

final DashboardController controller = Get.put(DashboardController()) ;

    @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: AppColors.secondarycolor,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero, 
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                        "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                  ),
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ntext(text:"admin",),
                    Ntext(text: "admin@gmail.com"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Get.toNamed("/dashboard");
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Marterail'),
              onTap: () {
                Get.toNamed("/material");
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Get.toNamed("/login");
              },
            ),
          ],
        ),
      ),
    );
  }
}
