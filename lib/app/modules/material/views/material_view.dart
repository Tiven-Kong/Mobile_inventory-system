import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vuthy_mobile/app/modules/material/controllers/switch_table.dart';
import 'package:vuthy_mobile/app/modules/material/views/viewmaterial_view.dart';
import 'package:vuthy_mobile/app/theme/colors_theme.dart';
import 'package:vuthy_mobile/app/widget/title_text.dart';
import '../../../widget/card_text.dart';
import '../../../widget/title_inbackground.dart';
import '../../Appbar/views/appbar_view.dart';
import '../../Appbar/views/drawer.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/material_controller.dart';
import '../controllers/material_status_controller.dart';
import 'Widget/status_select.dart';
import 'marterail_stock_view.dart';

class MaterialView extends StatelessWidget {
  final MaterialController controller = Get.put(MaterialController());
  final Material_StatusController controller_status = Get.put(Material_StatusController());

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
        child: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: Get.height,
                height: 300,
                decoration: BoxDecoration(color: AppColors.primarycolor , borderRadius: BorderRadius.circular(30)),
              ),
            ),
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
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
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


          ],
        ),
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
          DataCell(Center(
            child: GestureDetector(
              onTap: () {
                Get.to(MarterialView_id(itemData: material));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
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
          DataCell(Center(child: Text(material.id.toString()))),
          DataCell(Center(child: Text(material.name))),
          DataCell(Center(child: Text(material.materialCode))),
          DataCell(Center(child: Text(material.supplierId.toString()))),
          DataCell(Center(child: Text(material.status.toString()))),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
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
          DataCell(Center(child: Text(material.id.toString()))),
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
