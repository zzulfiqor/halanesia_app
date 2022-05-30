class MerchantEditRequest {
    MerchantEditRequest({
        this.type,
        this.name,
        this.email,
        this.phone,
        this.url,
        this.desc,
        this.address,
    });

    int? type;
    String? name;
    String? email;
    String? phone;
    String? url;
    String? desc;
    AddressRequest? address;

    Map<String, dynamic> toJson() => {
      "type": type,
      "name": name,
      "email": email,
      "phone": phone,
      "url": url,
      "desc": desc,
      "address": address?.toJson(),
    };
}

class AddressRequest {
    AddressRequest({
        this.address1,
        this.provinceId,
        this.province,
        this.cityId,
        this.city,
        this.suburbId,
        this.suburb,
        this.areaId,
        this.area,
        this.postalCode,
        this.note,
        this.phone,
    });

    String? address1;
    int? provinceId;
    String? province;
    int? cityId;
    String? city;
    int? suburbId;
    String? suburb;
    int? areaId;
    String? area;
    String? postalCode;
    String? note;
    String? phone;

    Map<String, dynamic> toJson() => {
        "address1": address1,
        "province_id": provinceId,
        "province": province,
        "city_id": cityId,
        "city": city,
        "suburb_id": suburbId,
        "suburb": suburb,
        "area_id": areaId,
        "area": area,
        "postal_code": postalCode,
        "note": note,
        "phone": phone,
    };
}
