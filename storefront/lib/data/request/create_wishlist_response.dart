class CreateWishlistResponse {
    CreateWishlistResponse({
        this.productDetailId,
        this.productId,
        this.stock,
        this.variant,
        this.variantType,
        this.status,
        this.isMain,
        this.amountSold,
        this.createdDate,
        this.updatedDate,
        this.wishlistId,
        this.userId,
    });

    int? productDetailId;
    String? productId;
    int? stock;
    String? variant;
    String? variantType;
    int? status;
    bool? isMain;
    int? amountSold;
    String? createdDate;
    String? updatedDate;
    int? wishlistId;
    int? userId;

    factory CreateWishlistResponse.fromJson(Map<String, dynamic> json) => CreateWishlistResponse(
        productDetailId: json["product_detail_id"],
        productId: json["product_id"],
        stock: json["stock"],
        variant: json["variant"],
        variantType: json["variant_type"],
        status: json["status"],
        isMain: json["is_main"],
        amountSold: json["amount_sold"],
        createdDate: json["created_date"],
        updatedDate: json["updated_date"],
        wishlistId: json["wishlist_id"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "product_detail_id": productDetailId,
        "product_id": productId,
        "stock": stock,
        "variant": variant,
        "variant_type": variantType,
        "status": status,
        "is_main": isMain,
        "amount_sold": amountSold,
        "created_date": createdDate,
        "updated_date": updatedDate,
        "wishlist_id": wishlistId,
        "user_id": userId,
    };
}
