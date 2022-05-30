class ShippingLocation {
    ShippingLocation({
        this.id,
        this.name,
        this.lat,
        this.lng,
        this.postcode,
    });

    int? id;
    String? name;
    double? lat;
    double? lng;
    String? postcode;

    factory ShippingLocation.fromJson(Map<String, dynamic> json) => ShippingLocation(
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
