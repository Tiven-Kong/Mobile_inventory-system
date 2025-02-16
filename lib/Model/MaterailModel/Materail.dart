class MaterialModel {
  num? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  num? perPage;
  Null? prevPageUrl;
  num? to;
  num? total;

  MaterialModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  MaterialModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  num? id;
  String? name;
  String? materialCode;
  num? quantity;
  num? remainingQuantity;
  num? unitPriceInUsd;
  num? totalValueInUsd;
  num? exchangeRateFromUsdToRiel;
  num? unitPriceInRiel;
  num? totalValueInRiel;
  num? exchangeRateFromRielToUsd;
  num? minimumStockLevel;
  String? unitOfMeasurement;
  String? packageSize;
  String? status;
  String? location;
  String? description;
  String? expiryDate;
  num? supplierId;
  num? rawMaterialCategoryId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? supplierName;
  List<dynamic>? rawMaterialImages;
  Category? category;
  Supplier? supplier;

  Data(
      {this.id,
        this.name,
        this.materialCode,
        this.quantity,
        this.remainingQuantity,
        this.unitPriceInUsd,
        this.totalValueInUsd,
        this.exchangeRateFromUsdToRiel,
        this.unitPriceInRiel,
        this.totalValueInRiel,
        this.exchangeRateFromRielToUsd,
        this.minimumStockLevel,
        this.unitOfMeasurement,
        this.packageSize,
        this.status,
        this.location,
        this.description,
        this.expiryDate,
        this.supplierId,
        this.rawMaterialCategoryId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.supplierName,
        this.rawMaterialImages,
        this.category,
        this.supplier});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    materialCode = json['material_code'];
    quantity = json['quantity'];
    remainingQuantity = json['remaining_quantity'];
    unitPriceInUsd = json['unit_price_in_usd'];
    totalValueInUsd = json['total_value_in_usd'];
    exchangeRateFromUsdToRiel = json['exchange_rate_from_usd_to_riel'];
    unitPriceInRiel = json['unit_price_in_riel'];
    totalValueInRiel = json['total_value_in_riel'];
    exchangeRateFromRielToUsd = json['exchange_rate_from_riel_to_usd'];
    minimumStockLevel = json['minimum_stock_level'];
    unitOfMeasurement = json['unit_of_measurement'];
    packageSize = json['package_size'];
    status = json['status'];
    location = json['location'];
    description = json['description'];
    expiryDate = json['expiry_date'];
    supplierId = json['supplier_id'];
    rawMaterialCategoryId = json['raw_material_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    supplierName = json['supplier_name'];
    if (json['raw_material_images'] != null) {
      rawMaterialImages = <dynamic>[];
      json['raw_material_images'].forEach((v) {
        rawMaterialImages!.add(v);
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    supplier = json['supplier'] != null
        ? new Supplier.fromJson(json['supplier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['material_code'] = this.materialCode;
    data['quantity'] = this.quantity;
    data['remaining_quantity'] = this.remainingQuantity;
    data['unit_price_in_usd'] = this.unitPriceInUsd;
    data['total_value_in_usd'] = this.totalValueInUsd;
    data['exchange_rate_from_usd_to_riel'] = this.exchangeRateFromUsdToRiel;
    data['unit_price_in_riel'] = this.unitPriceInRiel;
    data['total_value_in_riel'] = this.totalValueInRiel;
    data['exchange_rate_from_riel_to_usd'] = this.exchangeRateFromRielToUsd;
    data['minimum_stock_level'] = this.minimumStockLevel;
    data['unit_of_measurement'] = this.unitOfMeasurement;
    data['package_size'] = this.packageSize;
    data['status'] = this.status;
    data['location'] = this.location;
    data['description'] = this.description;
    data['expiry_date'] = this.expiryDate;
    data['supplier_id'] = this.supplierId;
    data['raw_material_category_id'] = this.rawMaterialCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['supplier_name'] = this.supplierName;
    if (this.rawMaterialImages != null) {
      data['raw_material_images'] = this.rawMaterialImages;
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.supplier != null) {
      data['supplier'] = this.supplier!.toJson();
    }
    return data;
  }
}


class Category {
  num? id;
  String? categoryName;
  String? description;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.categoryName,
        this.description,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Supplier {
  num? id;
  Null? image;
  String? name;
  String? supplierCode;
  String? phoneNumber;
  String? location;
  String? longitude;
  String? latitude;
  String? address;
  String? email;
  String? contactPerson;
  String? website;
  String? socialMedia;
  String? supplierCategory;
  String? supplierStatus;
  String? contractLength;
  String? discountTerm;
  String? paymentTerm;
  String? businessRegistrationNumber;
  String? vatNumber;
  String? bankAccountNumber;
  String? bankAccountName;
  String? bankName;
  String? note;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Supplier(
      {this.id,
        this.image,
        this.name,
        this.supplierCode,
        this.phoneNumber,
        this.location,
        this.longitude,
        this.latitude,
        this.address,
        this.email,
        this.contactPerson,
        this.website,
        this.socialMedia,
        this.supplierCategory,
        this.supplierStatus,
        this.contractLength,
        this.discountTerm,
        this.paymentTerm,
        this.businessRegistrationNumber,
        this.vatNumber,
        this.bankAccountNumber,
        this.bankAccountName,
        this.bankName,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    supplierCode = json['supplier_code'];
    phoneNumber = json['phone_number'];
    location = json['location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    email = json['email'];
    contactPerson = json['contact_person'];
    website = json['website'];
    socialMedia = json['social_media'];
    supplierCategory = json['supplier_category'];
    supplierStatus = json['supplier_status'];
    contractLength = json['contract_length'];
    discountTerm = json['discount_term'];
    paymentTerm = json['payment_term'];
    businessRegistrationNumber = json['business_registration_number'];
    vatNumber = json['vat_number'];
    bankAccountNumber = json['bank_account_number'];
    bankAccountName = json['bank_account_name'];
    bankName = json['bank_name'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['supplier_code'] = this.supplierCode;
    data['phone_number'] = this.phoneNumber;
    data['location'] = this.location;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['address'] = this.address;
    data['email'] = this.email;
    data['contact_person'] = this.contactPerson;
    data['website'] = this.website;
    data['social_media'] = this.socialMedia;
    data['supplier_category'] = this.supplierCategory;
    data['supplier_status'] = this.supplierStatus;
    data['contract_length'] = this.contractLength;
    data['discount_term'] = this.discountTerm;
    data['payment_term'] = this.paymentTerm;
    data['business_registration_number'] = this.businessRegistrationNumber;
    data['vat_number'] = this.vatNumber;
    data['bank_account_number'] = this.bankAccountNumber;
    data['bank_account_name'] = this.bankAccountName;
    data['bank_name'] = this.bankName;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
