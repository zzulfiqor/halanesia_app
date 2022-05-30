class ShippingCountry {
    ShippingCountry({
        this.id,
        this.name,
        this.code,
    });

    int? id;
    String? name;
    String? code;

    factory ShippingCountry.fromJson(Map<String, dynamic> json) => ShippingCountry(
        id: json["id"],
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
    };
}
