// import 'package:profile/data/response/user_address_data.dart';

// class UserAddressListResponse {
//     UserAddressListResponse({
//         this.statusCode,
//         this.data,
//         this.message,
//     });

//     String? statusCode;
//     List<UserAddressData>? data;
//     String? message;

//     factory UserAddressListResponse.fromJson(Map<String, dynamic> json) => UserAddressListResponse(
//         statusCode: json["statusCode"],
//         data: List<UserAddressData>.from(json["data"].map((x) => UserAddressData.fromJson(x))),
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "statusCode": statusCode,
//         "data":  List<dynamic>.from(data!.map((x) => x.toJson())),
//         "message": message,
//     };
// }