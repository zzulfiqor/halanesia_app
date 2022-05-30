class MerchantProductResponse {
    MerchantProductResponse({
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

    factory MerchantProductResponse.fromJson(Map<String, dynamic> json) => MerchantProductResponse(
        hasProduct: json["hasProduct"],
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        items: List<ProductEntity>.from(json["items"].map((x) => ProductEntity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hasProduct": hasProduct,
        "totalItems": totalItems,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "items": items != null ? List<dynamic>.from(items!.map((x) => x.toJson())) : [],
    };
}

class ProductEntity {
    ProductEntity({
        this.productId,
        this.productDetailId,
        this.productTitle,
        this.originalPrice,
        this.price,
        this.discount,
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
        "product_image": productImage,
        "rating": rating ?? 0.0,
        "is_in_wishlist": isInWishlist,
    };
}
