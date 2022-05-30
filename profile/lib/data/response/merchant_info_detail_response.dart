import 'merchant_address_detail_response.dart';

class MerchantInfoDetailResponse {
    MerchantInfoDetailResponse({
        this.id,
        this.name,
        this.type,
        this.phone,
        this.email,
        this.desc,
        this.url,
        this.isPhysical,
        this.address,
        this.profilePicture
    });

    int? id;
    String? name;
    MerchantType? type;
    String? phone;
    String? email;
    String? desc;
    String? url;
    bool? isPhysical;
    MerchantAddressDetailData? address;
    String? profilePicture;

    factory MerchantInfoDetailResponse.fromJson(Map<String, dynamic> json) => MerchantInfoDetailResponse(
        id: json["id"],
        name: json["name"],
        type: json["type"] == null ? null : MerchantType.fromJson(json["type"]),
        phone: json["phone"],
        email: json["email"],
        desc: json["desc"],
        url: json["url"],
        isPhysical: json["is_physical"],
        address: json["address"] == null ? null : MerchantAddressDetailData.fromJson(json["address"]),
        profilePicture: json["profile_picture"] == null ? null : json["profile_picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type == null ? null : type?.toJson(),
        "phone": phone,
        "email": email,
        "desc": desc,
        "url": url,
        "is_physical": isPhysical,
        "address": address == null ? null : address?.toJson(),
        "profile_picture": profilePicture == null ? null : profilePicture,
    };
}

class MerchantType {
    MerchantType({
        this.typeId,
        this.typeName,
    });

    int? typeId;
    String? typeName;

    factory MerchantType.fromJson(Map<String, dynamic> json) => MerchantType(
        typeId: json["type_id"],
        typeName: json["type_name"],
    );

    Map<String, dynamic> toJson() => {
        "type_id": typeId,
        "type_name": typeName,
    };
}

