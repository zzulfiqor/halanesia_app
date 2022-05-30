import 'package:profile/data/response/user_address_data.dart';

class UserInfoResponse {
    UserInfoResponse({
        this.userId,
        this.fullname,
        this.email,
        this.phone,
        this.imgPath,
        this.status,
        this.isVerifiedEmail,
        this.isVerifiedPhone,
        this.hasMerchant,
        this.address,
    });

    int? userId;
    String? fullname;
    String? email;
    String? phone;
    String? imgPath;
    int? status;
    bool? isVerifiedEmail;
    bool? isVerifiedPhone;
    bool? hasMerchant;
    UserAddressResponse? address;


    factory UserInfoResponse.fromJson(Map<String, dynamic> json) => UserInfoResponse(
        userId: json["user_id"],
        fullname: json["fullname"],
        email: json["email"],
        phone: json["phone"],
        imgPath: json["img_path"],
        status: json["status"],
        isVerifiedEmail: json["is_verified_email"],
        isVerifiedPhone: json["is_verified_phone"],
        hasMerchant: json["has_merchant"],
        address: json["address"] == null ? null : UserAddressResponse.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fullname": fullname,
        "email": email,
        "phone": phone,
        "img_path": imgPath,
        "status": status,
        "is_verified_email": isVerifiedEmail,
        "is_verified_phone": isVerifiedPhone,
        "has_merchant": hasMerchant,
        "address": address == null ? null : address?.toJson(),
    };
}