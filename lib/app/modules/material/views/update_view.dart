import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vuthy_mobile/app/widget/title_text.dart';
import '../../login/controllers/login_provider.dart';
import '../controllers/material_controller.dart';
import 'Widget/inputForm.dart';


class UpdateView extends StatefulWidget {
  UpdateView({super.key, required this.data});
  final dynamic data; // Explicit type for clarity
  final LoginController controller = Get.find<LoginController>();


  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  final dio = Dio();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  MaterialController controller = Get.put(MaterialController()) ;
  // Declare controllers
  final TextEditingController _materialName = TextEditingController();
  final TextEditingController _materialCode = TextEditingController();
  final TextEditingController _expirydate = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _remainingQuantity = TextEditingController();
  final TextEditingController _minimumStockLevel = TextEditingController();
  final TextEditingController _rawMaterialCategory = TextEditingController();
  final TextEditingController _status = TextEditingController();
  final TextEditingController _unit = TextEditingController();
  final TextEditingController _packageSize = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _unitPriceUSD = TextEditingController();
  final TextEditingController _totalValueUSD = TextEditingController();
  final TextEditingController _exchangeUSD = TextEditingController();
  final TextEditingController _unitPriceRiel = TextEditingController();
  final TextEditingController _totalValueRiel = TextEditingController();
  final TextEditingController _exchangeRiel = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _supplierId = TextEditingController();

  @override
  void initState() {
    super.initState();

    //for expiryData
    if (widget.data.expiryDate != null && widget.data.expiryDate.isNotEmpty) {
      DateTime? parsedDate = DateTime.tryParse(widget.data.expiryDate);
      if (parsedDate != null) {
        _expirydate.text = DateFormat('dd-MM-yyyy').format(parsedDate); // Convert to dd-MM-yyyy
      } else {
        _expirydate.text = '';
      }
    } else {
      _expirydate.text = '';
    }

    // Populate existing controllers instead of reassigning
    _materialName.text = widget.data.name ?? '';
    _materialCode.text = widget.data.materialCode ?? '';
    _supplierId.text = widget.data.supplierId?.toString() ?? '0';
    _expirydate.text = widget.data.expiryDate  ?? '';
    _quantity.text = widget.data.quantity?.toString() ?? '0';
    _remainingQuantity.text = widget.data.remainingQuantity?.toString() ?? '0';
    _minimumStockLevel.text = widget.data.minimumStockLevel?.toString() ?? '0';
    _rawMaterialCategory.text = widget.data.category?.id?.toString() ?? '0'; // Ensure this is an ID
    _status.text = widget.data.status.toString() ?? '';
    _unit.text = widget.data.unitOfMeasurement ?? '';
    _packageSize.text = widget.data.packageSize?.toString() ?? 'small';
    _location.text = widget.data.location ?? '';
    _unitPriceUSD.text = widget.data.unitPriceInUsd?.toString() ?? '0';
    _totalValueUSD.text = widget.data.totalValueInUsd?.toString() ?? '0';
    _exchangeUSD.text = widget.data.exchangeRateFromUsdToRiel?.toString() ?? '0';
    _unitPriceRiel.text = widget.data.unitPriceInRiel?.toString() ?? '0';
    _totalValueRiel.text = widget.data.totalValueInRiel?.toString() ?? '0';
    _exchangeRiel.text = widget.data.exchangeRateFromRielToUsd?.toString() ?? '0';
    _description.text = widget.data.description.toString() ?? '';

  }

  Future<void> update(num id) async {
    try {
      final response = await dio.patch(
        'https://ims-api.bananacentercambodia.com/api/raw-material/$id',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.controller.box.read('token')}',
          },
        ),
        data: {
          "name": _materialName.text,
          "supplier_id": num.tryParse(_supplierId.text) ?? 0,
          "quantity": num.tryParse(_quantity.text) ?? 0,
          "status": _status.text ?? "",
          "location": _location.text.isNotEmpty ? _location.text : "",
          "expiry_date": _expirydate.text.isNotEmpty
              ? DateFormat('yyyy-MM-dd').format(DateFormat('dd-MM-yyyy').parse(_expirydate.text))
              : "",
          "package_size":_packageSize.text ?? "" ,
          "remaining_quantity":_remainingQuantity.text,
          "unit_price_in_usd": num.tryParse(_unitPriceUSD.text) ?? 0,
          "exchange_rate_from_usd_to_riel": num.tryParse(_exchangeUSD.text) ?? 0,
          "minimum_stock_level": num.tryParse(_minimumStockLevel.text) ?? 0,
          "unit_of_measurement": _unit.text ?? "",
          "raw_material_category_id": num.tryParse(_rawMaterialCategory.text) ?? 0,
          "description":_description.text?? "" ,
        },
      );
        if(response.statusCode==200 || response.statusCode==201){
           controller.fetchMaterial() ;
          print("Update Successful: ${response.data}");
          Get.snackbar("Success", "Material updated successfully",
              snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
        }

    } on DioException catch (e) {
      print("Error Response: ${e.response?.data}");
      print("Status Code: ${e.response?.statusCode}");

      Get.snackbar("Error", "Failed to update material: ${e.response?.statusMessage}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Ttext(text: 'General Info'),
                  InputForm(controll_er: _materialName, tittle: "Material Name"),
                  InputForm(controll_er: _materialCode, tittle: "Material Code (Auto Generated)"),
                  InputForm(controll_er: _expirydate, tittle: "Expiry Date"),

                  Ttext(text: 'Stock Info'),
                  InputForm(controll_er: _quantity, tittle: "Quantity"),
                  InputForm(controll_er: _remainingQuantity, tittle: "Remaining Quantity"),
                  InputForm(controll_er: _rawMaterialCategory, tittle: "Raw Material Category"),
                  InputForm(controll_er: _status, tittle: "Status"),
                  InputForm(controll_er: _unit, tittle: "Unit of Measurement"),
                  InputForm(controll_er: _packageSize, tittle: "Package Size"),
                  InputForm(controll_er: _location, tittle: "Location"),

                  Ttext(text: 'Currency Info'),
                  InputForm(controll_er: _unitPriceUSD, tittle: "Unit Price in USD"),
                  InputForm(controll_er: _totalValueUSD, tittle: "Total Price in USD"),
                  InputForm(controll_er: _exchangeUSD, tittle: "Exchange Rate From USD to Riel"),

                  Ttext(text: 'Riel Currency Info'),
                  InputForm(controll_er: _unitPriceRiel, tittle: "Unit Price in Riel"),
                  InputForm(controll_er: _totalValueRiel, tittle: "Total Price in Riel"),
                  InputForm(controll_er: _exchangeRiel, tittle: "Exchange Rate From Riel to USD"),

                  Ttext(text: 'Description'),
                  InputForm(controll_er: _description, tittle: "Description"),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        update(widget.data.id);
                        Get.back() ;
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
