class ProductRelatedResponse {
    ProductRelatedResponse({
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
    List<RelatedItem>? items;

    factory ProductRelatedResponse.fromJson(Map<String, dynamic> json) => ProductRelatedResponse(
        hasProduct: json["hasProduct"] == null ? null : json["hasProduct"],
        totalItems: json["totalItems"] == null ? null : json["totalItems"],
        currentPage: json["currentPage"] == null ? null : json["currentPage"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        items: json["items"] == null ? null : List<RelatedItem>.from(json["items"].map((x) => RelatedItem.fromJson(x))),
    );
}

class RelatedItem {
    RelatedItem({
        this.productId,
        this.productDetailId,
        this.productTitle,
        this.originalPrice,
        this.price,
        this.discount,
        this.productImage,
        this.rating,
    });

    int? productId;
    int? productDetailId;
    String? productTitle;
    int? originalPrice;
    int? price;
    dynamic? discount;
    String? productImage;
    double? rating;

    factory RelatedItem.fromJson(Map<String, dynamic> json) => RelatedItem(
        productId: json["product_id"] == null ? null : json["product_id"],
        productDetailId: json["product_detail_id"] == null ? null : json["product_detail_id"],
        productTitle: json["product_title"] == null ? null : json["product_title"],
        originalPrice: json["original_price"] == null ? null : json["original_price"],
        price: json["price"] == null ? null : json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        productImage: json["product_image"] == null ? null : json["product_image"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "product_detail_id": productDetailId == null ? null : productDetailId,
        "product_title": productTitle == null ? null : productTitle,
        "original_price": originalPrice == null ? null : originalPrice,
        "price": price == null ? null : price,
        "discount": discount == null ? null : discount,
        "product_image": productImage == null ? null : productImage,
        "rating": rating == null ? null : rating,
    };
}
