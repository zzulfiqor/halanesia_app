import 'package:store/data/product_entity.dart';

class MerchantProductResponse {
  MerchantProductResponse(
      {required this.hasProduct,
      required this.totalItems,
      required this.currentPage,
      required this.totalPages,
      required this.items});

  late final bool hasProduct;
  late final int totalItems;
  late final int currentPage;
  late final int totalPages;
  late final List<ProductEntity> items;

  MerchantProductResponse.fromJson(Map<String, dynamic> json) {
    hasProduct = json['hasProduct'] ?? false;
    totalItems = json['totalItems'] ?? 0;
    currentPage = json['currentPage'] ?? 1;
    totalPages = json['totalPages'] ?? 1;
    items = json['items'] != null
        ? List<ProductEntity>.from(
            json['items'].map((x) => ProductEntity.fromJson(x)))
        : [];
  }
}
