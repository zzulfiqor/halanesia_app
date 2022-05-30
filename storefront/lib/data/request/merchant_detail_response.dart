class MerchantDetailResponse {
    MerchantDetailResponse({
        this.id,
        this.name,
        this.phone,
        this.email,
        this.desc,
        this.url,
        this.isPhysical,
        this.type,
        this.address,
        this.profilePicture,
    });

    int? id;
    String? name;
    String? phone;
    String? email;
    String? desc;
    String? url;
    bool? isPhysical;
    MerchantType? type;
    MerchantAddress? address;
    String? profilePicture;

    factory MerchantDetailResponse.fromJson(Map<String, dynamic> json) => MerchantDetailResponse(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        desc: json["desc"],
        url: json["url"],
        isPhysical: json["is_physical"],
        type: MerchantType.fromJson(json["type"]),
        address: MerchantAddress.fromJson(json["address"]),
        profilePicture: json["profile_picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "desc": desc,
        "url": url,
        "is_physical": isPhysical,
        "type": type?.toJson(),
        "address": address?.toJson(),
        "profile_picture": profilePicture,
    };
}

class MerchantAddress {
    MerchantAddress({
        this.id,
        this.recipient,
        this.phone,
        this.address1,
        this.address2,
        this.areaId,
        this.area,
        this.suburbId,
        this.suburb,
        this.cityId,
        this.city,
        this.provinceId,
        this.province,
        this.countryId,
        this.country,
        this.postalCode,
        this.addressTag,
        this.isPrimary,
        this.note,
    });

    int? id;
    String? recipient;
    String? phone;
    String? address1;
    String? address2;
    int? areaId;
    String? area;
    int? suburbId;
    String? suburb;
    int? cityId;
    String? city;
    int? provinceId;
    String? province;
    int? countryId;
    String? country;
    String? postalCode;
    String? addressTag;
    bool? isPrimary;
    String? note;

    factory MerchantAddress.fromJson(Map<String, dynamic> json) => MerchantAddress(
        id: json["id"],
        recipient: json["recipient"],
        phone: json["phone"],
        address1: json["address1"],
        address2: json["address2"],
        areaId: json["area_id"],
        area: json["area"],
        suburbId: json["suburb_id"],
        suburb: json["suburb"],
        cityId: json["city_id"],
        city: json["city"],
        provinceId: json["province_id"],
        province: json["province"],
        countryId: json["country_id"],
        country: json["country"],
        postalCode: json["postal_code"],
        addressTag: json["address_tag"],
        isPrimary: json["is_primary"],
        note: json["note"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "recipient": recipient,
        "phone": phone,
        "address1": address1,
        "address2": address2,
        "area_id": areaId,
        "area": area,
        "suburb_id": suburbId,
        "suburb": suburb,
        "city_id": cityId,
        "city": city,
        "province_id": provinceId,
        "province": province,
        "country_id": countryId,
        "country": country,
        "postal_code": postalCode,
        "address_tag": addressTag,
        "is_primary": isPrimary,
        "note": note,
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
