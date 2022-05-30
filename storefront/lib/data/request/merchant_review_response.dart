class MerchantReviewResponse {
    MerchantReviewResponse({
        this.hasItem,
        this.totalItems,
        this.currentPage,
        this.totalPages,
        this.items,
    });

    bool? hasItem;
    int? totalItems;
    int? currentPage;
    int? totalPages;
    List<MerchantReviewEntity>? items;

    factory MerchantReviewResponse.fromJson(Map<String, dynamic> json) => MerchantReviewResponse(
        hasItem: json["hasItem"],
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        items: List<MerchantReviewEntity>.from(json["items"].map((x) => MerchantReviewEntity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hasItem": hasItem,
        "totalItems": totalItems,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class MerchantReviewEntity {
    MerchantReviewEntity({
        this.userName,
        this.rate,
        this.comment,
        this.userImage,
        this.createdDate,
    });

    String? userName;
    int? rate;
    String? comment;
    String? userImage;
    String? createdDate;

    factory MerchantReviewEntity.fromJson(Map<String, dynamic> json) => MerchantReviewEntity(
        userName: json["user_name"],
        rate: json["rate"],
        comment: json["comment"],
        userImage: json["user_image"],
        createdDate: json['created_date'],
    );

    Map<String, dynamic> toJson() => {
        "user_name": userName,
        "rate": rate,
        "comment": comment,
        "user_image": userImage,
        "created_date": createdDate,
    };
}
