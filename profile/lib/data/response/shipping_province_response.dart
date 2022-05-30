import 'shipping_country_data.dart';
import 'shipping_location_data.dart';

// class ShippingProvinceResponse {
//     ShippingProvinceResponse({
//         this.statusCode,
//         this.data,
//         this.message,
//     });

//     String? statusCode;
//     ShippingProvinceData? data;
//     String? message;

//     factory ShippingProvinceResponse.fromJson(Map<String, dynamic> json) => ShippingProvinceResponse(
//         statusCode: json["statusCode"],
//         data: ShippingProvinceData.fromJson(json["data"]),
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "statusCode": statusCode,
//         "data": data?.toJson(),
//         "message": message,
//     };
// }

class ShippingProvinceResponse {
    ShippingProvinceResponse({
        this.country,
        this.provinces,
    });

    ShippingCountry? country;
    List<ShippingLocation>? provinces;

    factory ShippingProvinceResponse.fromJson(Map<String, dynamic> json) => ShippingProvinceResponse(
        country: ShippingCountry.fromJson(json["country"]),
        provinces: List<ShippingLocation>.from(json["provinces"].map((x) => ShippingLocation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
        "provinces": List<dynamic>.from(provinces!.map((x) => x.toJson())),
    };
}

