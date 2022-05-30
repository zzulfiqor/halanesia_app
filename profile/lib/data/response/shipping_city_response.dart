import 'shipping_country_data.dart';
import 'shipping_location_data.dart';

class ShippingCityResponse {
    ShippingCityResponse({
        this.country,
        this.province,
        this.cities,
    });

    ShippingCountry? country;
    ShippingLocation? province;
    List<ShippingLocation>? cities;

    factory ShippingCityResponse.fromJson(Map<String, dynamic> json) => ShippingCityResponse(
        country: json["country"] == null ? null : ShippingCountry.fromJson(json["country"]),
        province: json["province"] == null ? null : ShippingLocation.fromJson(json["province"]),
        cities: json["cities"] == null ? null : List<ShippingLocation>.from(json["cities"].map((x) => ShippingLocation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
        "province": province?.toJson(),
        "cities": List<dynamic>.from(cities!.map((x) => x.toJson())),
    };
}

