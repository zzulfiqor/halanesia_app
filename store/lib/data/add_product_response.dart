class AddProductResponse {
  AddProductResponse({
    required this.product,
  });

  late final UpdatedProduct product;

  AddProductResponse.fromJson(Map<String, dynamic> json) {
    product = UpdatedProduct.fromJson(json['updatedProduct']);
  }
}

class UpdatedProduct {
  UpdatedProduct({
    required this.productId,
    required this.stock,
    required this.createdBy,
    required this.updatedBy,
  });

  late final int? productId;
  late final int? stock;
  late final int? createdBy;
  late final int? updatedBy;

  UpdatedProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    stock = json['stock'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }
}
