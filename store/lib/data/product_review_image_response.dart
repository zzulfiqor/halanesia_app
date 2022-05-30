class ProductReviewImageResponse {
    ProductReviewImageResponse({
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
    List<ReviewImageItem>? items;

    factory ProductReviewImageResponse.fromJson(Map<String, dynamic> json) => ProductReviewImageResponse(
        hasItem: json["hasItem"] == null ? false : json["hasItem"],
        totalItems: json["totalItems"] == null ? null : json["totalItems"],
        currentPage: json["currentPage"] == null ? null : json["currentPage"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        items: json["items"] == null ? null : List<ReviewImageItem>.from(json["items"].map((x) => ReviewImageItem.fromJson(x))),
    );
}

class ReviewImageItem {
    ReviewImageItem({
        this.userName,
        this.rate,
        this.comment,
        this.imagePath,
    });

    String? userName;
    int? rate;
    String? comment;
    String? imagePath;

    factory ReviewImageItem.fromJson(Map<String, dynamic> json) => ReviewImageItem(
        userName: json["user_name"] == null ? null : json["user_name"],
        rate: json["rate"] == null ? null : json["rate"],
        comment: json["comment"] == null ? null : json["comment"],
        imagePath: json["image_path"] == null ? "" : json["image_path"],
    );  

    Map<String, dynamic> toJson() => {
      "user_name": userName == null ? "" : userName,
      "rate": rate == null ? "" : rate,
      "comment": comment == null ? "" : comment,
      "image_path": imagePath == null ? "" : imagePath,
    };
}