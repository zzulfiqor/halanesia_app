class ShippingOptionResponse {
    ShippingOptionResponse({
        this.id,
        this.name,
        this.options,
    });

    int? id;
    String? name;
    List<OptionCourier>? options;

    factory ShippingOptionResponse.fromJson(Map<String, dynamic> json) => ShippingOptionResponse(
        id: json["id"],
        name: json["name"],
        options: List<OptionCourier>.from(json["options"].map((x) => OptionCourier.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "options": List<dynamic>.from(options!.map((x) => x.toJson())),
    };
}

class OptionCourier {
    OptionCourier({
        this.id,
        this.title,
        this.desc,
        this.isChecked,
    });

    int? id;
    String? title;
    String? desc;
    bool? isChecked;

    factory OptionCourier.fromJson(Map<String, dynamic> json) => OptionCourier(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        isChecked: json["is_checked"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "is_checked": isChecked,
    };
}
