import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../dashboard/views/dashboard_view.dart';
import '../../material/views/material_view.dart';




class widgetDrawer extends StatelessWidget {
  const widgetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero, // Remove the extra padding on the top
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                        "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                  ),
                ),
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Admin"),
                    Text("admin@gmail.com"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {

              Get.to(DashboardView());
            },


          ),
          ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
