import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Appbar/views/appbar_view.dart';
import '../../Appbar/views/drawer.dart';
import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  UserView({super.key});
  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppbarView(),
      ),
      drawer: widgetDrawer(),
      body: Obx(() {
        return Column(
          children: [
            // Ensure PieChart doesn't cause overflow
            SizedBox(
              height: 300,
              child: Obx(() {
                return controller.UserList.isEmpty
                    ? const Center(child: CircularProgressIndicator()) // Show a loader
                    : PieChartWidget();
              }),
            ),
            // Prevent DataTable from overflowing
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical, // Enables vertical scrolling
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Phone')),
                      DataColumn(label: Text('Role')),
                      DataColumn(label: Text('Verified At')),
                    ],
                    rows: controller.UserList.map((user) {
                      return DataRow(cells: [
                        DataCell(Text(user.name.toString())),
                        DataCell(Text(user.id.toString())),
                        DataCell(Text(user.email.toString())),
                        DataCell(Text(user.phoneNumber.toString())),
                        DataCell(Text(user.role.toString())),
                        DataCell(Text(user.emailVerifiedAt.toString())),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  final UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap with SingleChildScrollView
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 500,
        width: 300,
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Colors.blue,
                value: 90,
                title: controller.UserList[0].name,
                radius: 50,
              ),
              PieChartSectionData(
                color: Colors.green,
                value: 10,
                title: controller.UserList[0].email,
                radius: 50,
              ),
            ],
            sectionsSpace: 2,
            centerSpaceRadius: 40,
          ),
        ),
      ),
    );
  }
}
