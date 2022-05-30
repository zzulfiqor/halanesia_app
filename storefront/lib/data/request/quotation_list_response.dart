class QuotationListResponse {
    QuotationListResponse({
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
    List<QuotationEntity>? items;

    factory QuotationListResponse.fromJson(Map<String, dynamic> json) => QuotationListResponse(
        hasItem: json["hasItem"],
        totalItems: json["totalItems"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        items:json['items'] != null ? List<QuotationEntity>.from(json["items"].map((x) => QuotationEntity.fromJson(x))) : [],
    );

    Map<String, dynamic> toJson() => {
        "hasItem": hasItem,
        "totalItems": totalItems,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "items": items != null ? List<QuotationEntity>.from(items!.map((x) => x.toJson())) : [],
    };
}

class QuotationEntity {
    QuotationEntity({
        this.id,
        this.name,
        this.desc,
        this.status,
        this.budget,
        this.currency,
        this.currencyId,
        this.deadline,
        this.merchant,
    });

    int? id;
    String? name;
    String? desc;
    int? status;
    int? budget;
    String? currency;
    int? currencyId;
    String? deadline;
    Merchant? merchant;

    factory QuotationEntity.fromJson(Map<String, dynamic> json) => QuotationEntity(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        status: json["status"],
        budget: json["budget"],
        currency: json["currency"],
        currencyId: json["currency_id"],
        deadline: json["deadline"],
        merchant: Merchant.fromJson(json["merchant"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "status": status,
        "budget": budget,
        "currency": currency,
        "currency_id": currencyId,
        "deadline": deadline,
        "merchant": merchant,
    };
}

class Merchant {
    Merchant({
        this.id,
        this.name,
        this.picture,
    });

    int? id;
    String? name;
    String? picture;

    factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picture": picture,
    };
}
