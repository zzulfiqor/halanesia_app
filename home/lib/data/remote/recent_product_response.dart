import 'package:home/data/remote/product_entity.dart';

class RecentProductResponse {
  RecentProductResponse({
    this.hasProduct,
    this.totalItems,
    this.currentPage,
    this.totalPages,
    this.items,
  });

  bool? hasProduct;
  int? totalItems;
  int? currentPage;
  int? totalPages;
  List<ProductEntity>? items;

  factory RecentProductResponse.fromJson(Map<String, dynamic> json) =>
      RecentProductResponse(
        hasProduct: json["hasProduct"],
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        items: json["hasProduct"] != false
            ? List<ProductEntity>.from(
                json["items"].map((x) => ProductEntity.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "hasProduct": hasProduct,
        "totalItems": totalItems,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "items": items != null
            ? List<ProductEntity>.from(items!.map((x) => x.toJson()))
            : [],
      };
}
