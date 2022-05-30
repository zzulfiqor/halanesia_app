class ProductReviewResponse {
    ProductReviewResponse({
        this.hasItem = false,
        this.totalItems,
        this.currentPage,
        this.totalPages,
        this.items,
    });

    bool hasItem;
    int? totalItems;
    int? currentPage;
    int? totalPages;
    List<ReviewItem>? items;

    factory ProductReviewResponse.fromJson(Map<String, dynamic> json) => ProductReviewResponse(
        hasItem: json["hasItem"] == null ? null : json["hasItem"],
        totalItems: json["totalItems"] == null ? null : json["totalItems"],
        currentPage: json["currentPage"] == null ? null : json["currentPage"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        items: json["items"] == null ? null : List<ReviewItem>.from(json["items"].map((x) => ReviewItem.fromJson(x))),
    );
}

class ReviewItem {
    ReviewItem({
        this.userName,
        this.rate,
        this.comment,
        this.userImage,
        this.productImage,
    });

    String? userName;
    int? rate;
    String? comment;
    String? userImage;
    List<String>? productImage;

    factory ReviewItem.fromJson(Map<String, dynamic> json) => ReviewItem(
        userName: json["user_name"] == null ? null : json["user_name"],
        rate: json["rate"] == null ? null : json["rate"],
        comment: json["comment"] == null ? "" : json["comment"],
        userImage: json["userImage"] == null ? "" : json["userImage"],
        productImage: json["product_image"] == null ? <String>[] : List<String>.from(json["product_image"].map((x) => x)),
    );
}

