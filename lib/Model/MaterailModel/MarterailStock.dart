class MaterialModel {
  int? rawMaterialCount;
  int? rawMaterialScrapCount;
  String? currentStockValueInUsd;
  String? currentStockValueInRiel;

  // Constructor
  MaterialModel({
    this.rawMaterialCount,
    this.rawMaterialScrapCount,
    this.currentStockValueInUsd,
    this.currentStockValueInRiel,
  });

  // Factory constructor to create an instance from JSON data
  MaterialModel.fromJson(Map<String, dynamic> json) {
    rawMaterialCount = json['raw_material_count'];
    rawMaterialScrapCount = json['raw_material_scrap_count'];
    currentStockValueInUsd = json['current_stock_value_in_usd'];
    currentStockValueInRiel = json['current_stock_value_in_riel'];
  }

  // Method to convert the instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'raw_material_count': rawMaterialCount,
      'raw_material_scrap_count': rawMaterialScrapCount,
      'current_stock_value_in_usd': currentStockValueInUsd,
      'current_stock_value_in_riel': currentStockValueInRiel,
    };
  }
}
