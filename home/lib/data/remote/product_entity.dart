// To parse this JSON data, do
//
//     final productEntity = productEntityFromJson(jsonString);

import 'dart:convert';

ProductEntity productEntityFromJson(String str) => ProductEntity.fromJson(json.decode(str));

String productEntityToJson(ProductEntity data) => json.encode(data.toJson());

class ProductEntity {
    ProductEntity({
        this.productId,
        this.productDetailId,
        this.productTitle,
        this.originalPrice,
        this.price,
        this.discount,
        this.storeName,
        this.location,
        this.productImage,
        this.rating,
        this.isInWishlist,
    });

    int? productId;
    int? productDetailId;
    String? productTitle;
    int? originalPrice;
    int? price;
    dynamic discount;
    String? storeName;
    String? location;
    String? productImage;
    double? rating;
    bool? isInWishlist;

    factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
        productId: json["product_id"],
        productDetailId: json["product_detail_id"],
        productTitle: json["product_title"],
        originalPrice: json["original_price"],
        price: json["price"],
        discount: json["discount"],
        storeName: json["store_name"],
        location: json["location"],
        productImage: json["product_image"],
        rating: json["rating"] == null ? 0.0 : json["rating"].toDouble(),
        isInWishlist: json["is_in_wishlist"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_detail_id": productDetailId,
        "product_title": productTitle,
        "original_price": originalPrice,
        "price": price,
        "discount": discount,
        "store_name": storeName,
        "location": location,
        "product_image": productImage,
        "rating": rating,
        "is_in_wishlist": isInWishlist,
    };
}
