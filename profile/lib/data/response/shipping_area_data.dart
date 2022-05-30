class ShippingArea {
    ShippingArea({
        this.id,
        this.name,
        this.lat,
        this.lng,
        this.postcode,
    });

    String? id;
    String? name;
    double? lat;
    double? lng;
    String? postcode;

    factory ShippingArea.fromJson(Map<String, dynamic> json) => ShippingArea(
        id: json["id"],
        name: json["name"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        postcode: json["postcode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lat": lat,
        "lng": lng,
        "postcode": postcode,
    };
}
