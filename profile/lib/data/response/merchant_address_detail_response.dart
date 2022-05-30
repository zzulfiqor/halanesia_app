class MerchantAddressDetailResponse {
    MerchantAddressDetailResponse({
        this.statusCode,
        this.data,
        this.message,
    });

    String? statusCode;
    MerchantAddressDetailData? data;
    String? message;

    factory MerchantAddressDetailResponse.fromJson(Map<String, dynamic> json) => MerchantAddressDetailResponse(
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : MerchantAddressDetailData.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data == null ? null : data?.toJson(),
        "message": message,
    };
}

class MerchantAddressDetailData {
    MerchantAddressDetailData({
        this.id,
        this.merchantId,
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
    int? merchantId;
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

    factory MerchantAddressDetailData.fromJson(Map<String, dynamic> json) => MerchantAddressDetailData(
        id: json["id"],
        merchantId: json["merchant_id"],
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
        "merchant_id": merchantId,
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
