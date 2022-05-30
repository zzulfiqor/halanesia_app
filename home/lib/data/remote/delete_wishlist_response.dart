class DeleteWishlistResponse {
  DeleteWishlistResponse({
    this.createdDate,
    this.updatedDate,
    this.wishlistId,
    this.productDetailId,
    this.status,
  });

  String? createdDate;
  String? updatedDate;
  int? wishlistId;
  int? productDetailId;
  int? status;

  factory DeleteWishlistResponse.fromJson(Map<String, dynamic> json) =>
      DeleteWishlistResponse(
        createdDate: json["created_date"],
        updatedDate: json["updated_date"],
        wishlistId: json["wishlist_id"],
        productDetailId: json["product_detail_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "created_date": createdDate,
        "updated_date": updatedDate,
        "wishlist_id": wishlistId,
        "product_detail_id": productDetailId,
        "status": status,
      };
}
