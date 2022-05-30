import 'dart:convert';

RequestModel requestModelFromJson(String str) => RequestModel.fromJson(json.decode(str));

String requestModelToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
    RequestModel({
        required this.name,
        required this.image,
        required this.request,
        required this.day,
        required this.price,
    });

    String name;
    String image;
    String request;
    int day;
    int price;

    factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        name: json["name"],
        image: json["image"],
        request: json["request"],
        day: json["day"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "page": name,
        "image": image,
        "request": request,
        "day": day,
        "price": price,
    };
}

var dataRequest = [
  RequestModel(
    name: "PT Unilever Tbk",
    image: "http://diegopinna.com/koken/storage/cache/images/000/111/Unilever-logo,medium_large.1609716277.png",
    request: "Penyediaan Kursi dan Meja Kantor", 
    day: 5,
    price: 3000000,
  ),
  RequestModel(
    name: "PT Indofood Tbk",
    image: "https://akcdn.detik.net.id/visual/2015/01/04/a2c5f53f-bf4b-4eff-9e4f-773e879068d8_169.jpg?w=650",
    request: "Penyediaan Kursi dan Meja Kantor", 
    day: 5,
    price: 5000000,
  ),
];
