class ProdcutStockModel {
  int? productCount;
  int? productScrapCount;
  String? currentStockValueInUsd;
  String? currentStockValueInRiel;

  ProdcutStockModel(
      {this.productCount,
        this.productScrapCount,
        this.currentStockValueInUsd,
        this.currentStockValueInRiel});

  ProdcutStockModel.fromJson(Map<String, dynamic> json) {
    productCount = json['product_count'];
    productScrapCount = json['product_scrap_count'];
    currentStockValueInUsd = json['current_stock_value_in_usd'];
    currentStockValueInRiel = json['current_stock_value_in_riel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_count'] = this.productCount;
    data['product_scrap_count'] = this.productScrapCount;
    data['current_stock_value_in_usd'] = this.currentStockValueInUsd;
    data['current_stock_value_in_riel'] = this.currentStockValueInRiel;
    return data;
  }
}
