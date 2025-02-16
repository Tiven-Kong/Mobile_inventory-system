import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vuthy_mobile/app/modules/material/controllers/switch_table.dart';
import 'package:vuthy_mobile/app/modules/material/views/viewmaterial_view.dart';
import '../controllers/material_controller.dart';
import 'marterail_stock_view.dart';

class MaterialView extends StatelessWidget {
  final MaterialController controller = Get.put(MaterialController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materials'),
      ),
      body:


          SingleChildScrollView(
            child: Column(

              children: [
                MaterialStockView(),

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Raw Material Stock Summary",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(

                      hintText: "Search materials...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) => controller.S_each(value),
                  ),
                ),
                Obx(() {
                  if (controller.materials == null || controller.materials.isEmpty) {
                    return Center(child: Text("NO DATA")); // Centered text
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: _createColumns(),
                        rows: _createRows(),
                        columnSpacing: 18.0,
                      ),

                    );

                  }
                }),
                SwitchView(),
              ],
            ),
          ),







    );
  }















  List<DataColumn> _createColumns() {
    return const [
      DataColumn(label: Text('ViewDetial')),
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Code')),
      DataColumn(label: Text('Supplier ID')),
      DataColumn(label: Text('Status')),
      DataColumn(label: Text('Category')),
      DataColumn(label: Text('Quantity')),
      DataColumn(label: Text('Remaining Quantity')),
      DataColumn(label: Text('UNIT PRICE IN USD')),
      DataColumn(label: Text('TOTAL VALUE IN USD')),
      DataColumn(label: Text('EXCHANGE RATE USD TO RIEL')),
      DataColumn(label: Text('UNIT PRICE IN RIEL')),
      DataColumn(label: Text('TOTAL VALUE IN RIEL ')),
      DataColumn(label: Text('EXCHANGE RATE RIEL TO USD ')),
      DataColumn(label: Text('MINIMUM STOCK')),
      DataColumn(label: Text('Location')),
      DataColumn(label: Text('CREATED')),
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
                    Get.to(MarterialView_id
                      (itemData: material));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined),
                          Text(
                            "View",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )))),
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
