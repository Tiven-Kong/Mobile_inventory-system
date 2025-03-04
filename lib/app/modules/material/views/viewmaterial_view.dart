import 'package:flutter/material.dart';

import '../../../../Model/MaterailModel/Materail.dart';
import '../../../widget/normal_text_inbackground.dart';
import '../../../widget/title_inbackground.dart';
import '../../Appbar/views/appbar_view.dart';
import 'Widget/view_action.dart';

class MarterialView_id extends StatelessWidget {
  MarterialView_id({super.key, required this.itemData});

  dynamic itemData  ;

// Accepts any type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: AppbarView(),
        // You can optionally keep the AppBar title here or in AppbarView()
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ViewAction(information: itemData.name ?? '', tittle: "Material Name"),
              ViewAction(information: itemData.materialCode ?? '', tittle: "Material Code (Auto Generated)"),
              ViewAction(information: itemData.expiryDate ?? '', tittle: "Expiry Date"),
              ViewAction(information: itemData.quantity?.toString() ?? '0', tittle: "Quantity"),
              ViewAction(information: itemData.remainingQuantity?.toString() ?? '0', tittle: "Remaining Quantity"),
              ViewAction(information: itemData.minimumStockLevel?.toString() ?? '0', tittle: "Minimum"),
              ViewAction(information: itemData.category?.categoryName ?? 'N/A', tittle: "Raw Material Category"),
              ViewAction(information: itemData.status ?? '', tittle: "Status"),
              ViewAction(information: itemData.unitOfMeasurement ?? '', tittle: "Unit of Measurement"),
              ViewAction(information: itemData.packageSize ?? '', tittle: "Package Size"),
              ViewAction(information: itemData.location ?? '', tittle: "Location"),
              ViewAction(information: itemData.unitPriceInUsd?.toString() ?? '0', tittle: "Unit Price in USD"),
              ViewAction(information: itemData.totalValueInUsd?.toString() ?? '0', tittle: "Total Value in USD"),
              ViewAction(information: itemData.exchangeRateFromUsdToRiel?.toString() ?? '0', tittle: "Exchange Rate From USD to Riel"),
              ViewAction(information: itemData.unitPriceInRiel?.toString() ?? '0', tittle: "Unit Price in Riel"),
              ViewAction(information: itemData.totalValueInRiel?.toString() ?? '0', tittle: "Total Value in Riel"),
              ViewAction(information: itemData.exchangeRateFromRielToUsd?.toString() ?? '0', tittle: "Exchange Rate from Riel to USD"),
              ViewAction(information: itemData.description ?? '', tittle: "Description"),

            ],
          ),
        ),
      ),
    );
  }
}
