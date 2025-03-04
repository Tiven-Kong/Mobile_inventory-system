import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vuthy_mobile/app/modules/material/controllers/switch_table.dart';
import 'package:vuthy_mobile/app/modules/material/views/viewmaterial_view.dart';
import 'package:vuthy_mobile/app/theme/colors_theme.dart';
import 'package:vuthy_mobile/app/widget/title_text.dart';
import '../../../widget/card_text.dart';
import '../../../widget/normal_text_inbackground.dart';
import '../../../widget/title_inbackground.dart';
import '../../Appbar/views/appbar_view.dart';
import '../../Appbar/views/drawer.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/action_table_controller.dart';
import '../controllers/material_controller.dart';
import '../controllers/material_status_controller.dart';


import 'Widget/status_select.dart';
import 'marterail_stock_view.dart';

class MaterialView extends StatelessWidget {
  final MaterialController controller = Get.put(MaterialController());
  final Material_StatusController controller_status = Get.put(Material_StatusController());
  final ActionTableController controller_drop = Get.put(ActionTableController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppbarView(),
        // You can optionally keep the AppBar title here or in AppbarView()
      ),
      drawer: widgetDrawer(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Tbtext(text:  "Raw Material Stock Summary",),
                      )
                  ),
                  SizedBox(height: 20,),
                  MaterialStockView(),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search materials...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) => controller.S_each(value),
                    ),
                  ),
                  DropdownExample(),
                  Obx(() {
                    if (controller.materials == null || controller.materials.isEmpty) {
                      return Center(child: Text("NO DATA"));
                    } else {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: _createColumns(),
                          rows: controller_status.displayStatus.value
                              ? _createRowsStatus()
                              : _createRows(),
                          columnSpacing: 18.0,
                        ),
                      );
                    }
                  }),
                  SwitchView(),
                ],
              ),
            ),

            SizedBox(
              width:Get.width ,
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1), // Monday
                        FlSpot(1, 3), // Tuesday
                        FlSpot(2, 2), // Wednesday
                        FlSpot(3, 5), // Thursday
                        FlSpot(4, 4), // Friday
                        FlSpot(5, 6), // Saturday
                        FlSpot(6, 3), // Sunday
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text('Day of the Week'),
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                          return Text(days[value.toInt()], style: TextStyle(fontSize: 12));
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      axisNameWidget: Text('Values'),
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                ),
              ),
            )
          ],
        )


      ),
    );
  }

  List<DataColumn> _createColumns() {
    return const [
      DataColumn(label: Text('View Detail')),
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Code')),
      DataColumn(label: Text('Supplier ID')),
      DataColumn(label: Text('Status')),
      DataColumn(label: Text('Category')),
      DataColumn(label: Text('Quantity')),
      DataColumn(label: Text('Remaining Quantity')),
      DataColumn(label: Text('Unit Price in USD')),
      DataColumn(label: Text('Total Value in USD')),
      DataColumn(label: Text('Exchange Rate USD to Riel')),
      DataColumn(label: Text('Unit Price in Riel')),
      DataColumn(label: Text('Total Value in Riel')),
      DataColumn(label: Text('Exchange Rate Riel to USD')),
      DataColumn(label: Text('Minimum Stock')),
      DataColumn(label: Text('Location')),
      DataColumn(label: Text('Created')),
      DataColumn(label: Text('Updated')),
    ];
  }

  List<DataRow> _createRows() {

    return controller.materials.map((material) {
      return DataRow(
        cells: [
          DataCell(
            Center(
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: SizedBox(
                      width: 90,
                      height: 20,
                      child: DropdownButton<IconData>(
                        value: controller_drop.selectedIcon.value,
                        hint: Text("Action", style: TextStyle(fontSize: 10)),
                        onChanged: (newIcon) {
                          if (newIcon != null) {
                            controller_drop.changeIcon(newIcon  , material);

                          }

                        },
                        items: controller_drop.iconOptions.map((icon) {
                          return DropdownMenuItem<IconData>(
                            value: icon,
                            child: Row(
                              children: [
                                Icon(
                                  icon,
                                  size: 20,
                                  color: controller_drop.selectedIcon.value == icon ? Colors.blue : Colors.black,
                                ),

                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          DataCell(Center(child: NBtext(text:material.id.toString()))),
          DataCell(Center(child: NBtext(text:material.name.toString()))),
          DataCell(Center(child: NBtext(text:material.materialCode.toString()))),
          DataCell(Center(child: NBtext(text:material.supplierId.toString()))),
          DataCell(Center(child: Container(

               decoration: BoxDecoration(color:material.status.toString()=="IN_STOCK"?Colors.green[300]:Colors.red ,
               borderRadius: BorderRadius.circular(20)
               ),

              child: Padding(
                padding: const EdgeInsets.only(left: 5 , right: 5),
                child: NBtext(text:material.status.toString()),
              )))),
          DataCell(Center(child: Container(
            
            decoration: BoxDecoration(color: Colors.yellowAccent[100] , borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 5 , right: 5),
                child: NBtext(text:material.category?.categoryName ?? 'N/A' ),
              )))),
          
          
          DataCell(Center(child: NBtext(text:material.quantity.toString()))),
          DataCell(Center(child: NBtext(text:material.remainingQuantity.toString()))),
          DataCell(Center(child: NBtext(text:material.unitPriceInUsd.toString()))),
          DataCell(Center(child: NBtext(text:material.totalValueInUsd.toString()))),
          DataCell(Center(child: NBtext(text:"${material.exchangeRateFromUsdToRiel} /1\$"))),
          DataCell(Center(child: NBtext(text:"${material.unitPriceInRiel} \$"))),
          DataCell(Center(child: NBtext(text:"${material.totalValueInRiel} \$"))),
          DataCell(Center(child: NBtext(text: "${material.exchangeRateFromRielToUsd} /100\$"))),
          DataCell(Center(child: NBtext(text: "${material.minimumStockLevel} "))),
          DataCell(Center(child: NBtext(text: "${material.location} "))),
          DataCell(Center(child: NBtext(text:timeAgo(DateTime.parse(material.createdAt.toString()))))),
          DataCell(Center(child: NBtext(text:timeAgo(DateTime.parse(material.updatedAt.toString()))))),
        ],
      );
    }).toList();
  }

  List<DataRow> _createRowsStatus() {
    return controller_status.materials_status.map((material) {
      return DataRow(
        cells: [
          DataCell(Center(
            child: GestureDetector(
              onTap: () {
                Get.to(MarterialView_id(itemData: material));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: Row(
                    children: [
                      Icon(Icons.remove_red_eye_outlined),
                      Text(
                        "View",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
          DataCell(Center(child: Text(material.name.toString()))),
          DataCell(Center(child: Text(material.name))),
          DataCell(Center(child: Text(material.materialCode))),
          DataCell(Center(child: Text(material.supplierId.toString()))),
          DataCell(
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: material.status.toString() == "IN_STOCK" ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  material.status.toString(),
                  style: TextStyle(color: Colors.white), // Ensure text is visible
                ),
              ),
            ),
          ),
          DataCell(Center(child: Text(material.category.toString()))),
          DataCell(Center(child: Text(material.quantity.toString()))),
          DataCell(Center(child: Text(material.remainingQuantity.toString()))),
          DataCell(Center(child: Text(material.unitPriceInUsd.toString()))),
          DataCell(Center(child: Text(material.totalValueInUsd.toString()))),
          DataCell(Center(child: Text("${material.exchangeRateFromUsdToRiel} /1\$"))),
          DataCell(Center(child: Text("${material.unitPriceInRiel} \$"))),
          DataCell(Center(child: Text("${material.totalValueInRiel} \$"))),
          DataCell(Center(child: Text("${material.exchangeRateFromRielToUsd} /100\$"))),
          DataCell(Center(child: Text("${material.minimumStockLevel} "))),
          DataCell(Center(child: Text("${material.location} "))),
          DataCell(Center(child: Text(timeAgo(DateTime.parse(material.createdAt))))),
          DataCell(Center(child: Text(timeAgo(DateTime.parse(material.updatedAt))))),
        ],
      );
    }).toList();
  }

  String timeAgo(DateTime dateTime) {
    Duration difference = DateTime.now().difference(dateTime);
    if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    }
    return "${difference.inMinutes} minutes ago";
  }

  Widget _buildCard(String title, String subtitle) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.attach_money,
                color: Colors.greenAccent,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(subtitle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
