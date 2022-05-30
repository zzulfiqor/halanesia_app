class RecomendationResponse {
    RecomendationResponse({
        this.totalItems,
        this.currentPage,
        this.totalPages,
        this.items,
    });

    int? totalItems;
    int? currentPage;
    int? totalPages;
    List<RecomendationEntity>? items;

    factory RecomendationResponse.fromJson(Map<String, dynamic> json) => RecomendationResponse(
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        items: List<RecomendationEntity>.from(json["items"].map((x) => RecomendationEntity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class RecomendationEntity {
    RecomendationEntity({
        this.merchantId,
        this.merchantName,
        this.imgPath,
    });

    int? merchantId;
    String? merchantName;
    String? imgPath;

    factory RecomendationEntity.fromJson(Map<String, dynamic> json) => RecomendationEntity(
        merchantId: json["merchant_id"],
        merchantName: json["merchant_name"],
        imgPath: json["img_path"],
    );

    Map<String, dynamic> toJson() => {
        "merchant_id": merchantId,
        "merchant_name": merchantName,
        "img_path": imgPath,
    };
}
