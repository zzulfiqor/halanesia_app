import 'shipping_country_data.dart';
import 'shipping_location_data.dart';

class ShippingAreaResponse {
    ShippingAreaResponse({
        this.country,
        this.province,
        this.city,
        this.suburb,
        this.areas,
    });

    ShippingCountry? country;
    ShippingLocation? province;
    ShippingLocation? city;
    ShippingLocation? suburb;
    List<ShippingLocation>? areas;

    factory ShippingAreaResponse.fromJson(Map<String, dynamic> json) => ShippingAreaResponse(
        country: ShippingCountry.fromJson(json["country"]),
        province: ShippingLocation.fromJson(json["province"]),
        city: ShippingLocation.fromJson(json["city"]),
        suburb: ShippingLocation.fromJson(json["suburb"]),
        areas: List<ShippingLocation>.from(json["areas"].map((x) => ShippingLocation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
        "province": province?.toJson(),
        "city": city?.toJson(),
        "suburb": suburb?.toJson(),
        "areas": List<dynamic>.from(areas!.map((x) => x.toJson())),
    };
}

