class MerchantAddressListResponse {
    MerchantAddressListResponse({
        this.statusCode,
        this.data,
        this.message,
    });

    String? statusCode;
    List<MerchantAddressListData>? data;
    String? message;

    factory MerchantAddressListResponse.fromJson(Map<String, dynamic> json) => MerchantAddressListResponse(
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : List<MerchantAddressListData>.from(json["data"].map((x) => MerchantAddressListData.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
    };
}

class MerchantAddressListData {
    MerchantAddressListData({
        this.id,
        this.merchantId,
        this.recipient,
        this.phone,
        this.address1,
        this.address2,
        this.city,
        this.state,
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
    String? city;
    String? state;
    String? country;
    String? postalCode;
    String? addressTag;
    bool? isPrimary;
    String? note;

    factory MerchantAddressListData.fromJson(Map<String, dynamic> json) => MerchantAddressListData(
        id: json["id"],
        merchantId: json["merchant_id"],
        recipient: json["recipient"],
        phone: json["phone"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
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
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode,
        "address_tag": addressTag,
        "is_primary": isPrimary,
        "note": note,
    };
}
