class MaterialStockModel {
  int? rawMaterialCount;
  int? rawMaterialScrapCount;
  String? currentStockValueInUsd;
  String? currentStockValueInRiel;

  // Constructor
  MaterialStockModel({
    this.rawMaterialCount,
    this.rawMaterialScrapCount,
    this.currentStockValueInUsd,
    this.currentStockValueInRiel,
  });

  // Factory constructor to create an instance from JSON data
  factory MaterialStockModel.fromJson(Map<String, dynamic> json) {
    return MaterialStockModel(
      rawMaterialCount: json['raw_material_count'] as int?,
      rawMaterialScrapCount: json['raw_material_scrap_count'] as int?,
      currentStockValueInUsd: json['current_stock_value_in_usd'] as String?,
      currentStockValueInRiel: json['current_stock_value_in_riel'] as String?,
    );
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
