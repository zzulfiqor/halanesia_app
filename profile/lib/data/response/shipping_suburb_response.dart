import 'shipping_country_data.dart';
import 'shipping_location_data.dart';

class ShippingSuburbResponse {
    ShippingSuburbResponse({
        this.country,
        this.province,
        this.city,
        this.suburbs,
    });

    ShippingCountry? country;
    ShippingLocation? province;
    ShippingLocation? city;
    List<ShippingLocation>? suburbs;

    factory ShippingSuburbResponse.fromJson(Map<String, dynamic> json) => ShippingSuburbResponse(
        country: ShippingCountry.fromJson(json["country"]),
        province: ShippingLocation.fromJson(json["province"]),
        city: ShippingLocation.fromJson(json["city"]),
        suburbs: List<ShippingLocation>.from(json["suburbs"].map((x) => ShippingLocation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
        "province": province?.toJson(),
        "city": city?.toJson(),
        "suburbs": List<dynamic>.from(suburbs!.map((x) => x.toJson())),
    };
}

