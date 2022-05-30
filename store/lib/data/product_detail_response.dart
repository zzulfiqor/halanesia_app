class ProductDetailResponse {
    ProductDetailResponse({
        this.productId,
        this.productDetailId,
        this.productName,
        this.productDesc,
        this.productCategoryId,
        this.productCategory,
        this.minOrder,
        this.stock,
        this.originalPrice,
        this.price,
        this.discount,
        this.weight,
        this.weightUnit,
        this.dimX,
        this.dimY,
        this.dimZ,
        this.dimUnit,
        this.rating,
        this.amountSold,
        this.storeId,
        this.storeName,
        this.storeImage,
        this.storeLocation,
        this.productImage,
        this.halalMUI,
        this.marketingAuthorization,
        this.halalCertification,
        this.productReview,
    });

    int? productId;
    int? productDetailId;
    String? productName;
    String? productDesc;
    int? productCategoryId;
    String? productCategory;
    int? minOrder;
    int? stock;
    int? originalPrice;
    int? price;
    int? discount;
    int? weight;
    String? weightUnit;
    int? dimX;
    int? dimY;
    int? dimZ;
    String? dimUnit;
    double? rating;
    int? amountSold;
    int? storeId;
    String? storeName;
    String? storeImage;
    String? storeLocation;
    List<String>? productImage;
    bool? halalMUI;
    bool? marketingAuthorization;
    bool? halalCertification;
    List<ProductReview>? productReview;

    factory ProductDetailResponse.fromJson(Map<String, dynamic> json) => ProductDetailResponse(
        productId: json["product_id"] == null ? 0 : json["product_id"],
        productDetailId: json["product_detail_id"] == null ? "-" : json["product_detail_id"],
        productName: json["product_name"] == null ? "-" : json["product_name"],
        productDesc: json["product_desc"] == null ? "-" : json["product_name"],
        productCategoryId: json["product_category_id"] == null ? 0 : json["product_category_id"],
        productCategory: json["product_category"] == null ? "-" : json["product_category"],
        minOrder: json["min_order"] == null ? 0 : json["min_order"],
        stock: json["stock"] == null ? 0 : json["stock"],
        originalPrice: json["original_price"] == null ? 0 : json["original_price"],
        price: json["price"] == null ? 0 : json["price"],
        discount: json["discount"] == null ? 0 : json["discount"],
        weight: json["weight"] == null ? 0 : json["weight"],
        weightUnit: json["weight_unit"] == null ? "-" : json["weight_unit"],
        dimX: json["dim_x"] == null ? 0 : json["dim_x"],
        dimY: json["dim_y"] == null ? 0 : json["dim_y"],
        dimZ: json["dim_z"] == null ? 0 : json["dim_z"],
        dimUnit: json["dim_unit"] == null ?  "-" : json["dim_unit"],
        rating: json["rating"] == null ? 0.0 : json["rating"].toDouble(),
        amountSold: json["amount_sold"] == null ? 0 : json["amount_sold"],
        storeId: json["store_id"] == null ? 0 : json["store_id"],
        storeName: json["store_name"] == null ? "" : json["store_name"],
        storeImage: json["store_image"] == null ? "" : json["store_image"],
        storeLocation: json["store_location"] == null ? "" : json["store_location"],
        productImage: json["product_image"] == null ? null : List<String>.from(json["product_image"].map((x) => x)),
        halalMUI: json["halal_mui"] == null ? false : json["halal_mui"],
        marketingAuthorization: json["marketing_authorization"] == null ? false : json["marketing_authorization"],
        halalCertification: json["halal_certification"] == null ? false : json["halal_certification"],
        productReview: json["product_review"] == null ? null : List<ProductReview>.from(json["product_review"].map((x) => ProductReview.fromJson(x))),
  );
}

class ProductReview {
    ProductReview({
        this.reviewId,
        this.orderId,
        this.productId,
        this.productDetailId,
        this.userId,
        this.rate,
        this.comment,
        this.createdDate,
        this.updatedDate,
    });

    String? reviewId;
    String? orderId;
    String? productId;
    String? productDetailId;
    int? userId;
    int? rate;
    String? comment;
    String? createdDate;
    String? updatedDate;

    factory ProductReview.fromJson(Map<String, dynamic> json) => ProductReview(
        reviewId: json["review_id"] == null ?  "0" : json["review_id"],
        orderId: json["order_id"] == null ?  "0" : json["order_id"],
        productId: json["product_id"] == null ? "0" : json["product_id"],
        productDetailId: json["product_detail_id"] == null ? null : json["product_detail_id"],
        userId: json["user_id"] == null ? 0 : json["user_id"],
        rate: json["rate"] == null ? 0 : json["rate"],
        comment: json["comment"] == null ? "-" : json["comment"],
        createdDate: json["created_date"] == null ? null : json["created_date"],
        updatedDate: json["updated_date"] == null ? null : json["updated_date"],
    );
}
