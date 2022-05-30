class UserAddressRequest {
    UserAddressRequest({
        this.addressName,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.country,
        this.postalCode,
        this.addressTag,
        this.isPrimary,
        this.refShipperCountryId,
        this.refShipperProvinceId,
        this.refShipperCityId,
        this.refShipperSuburbId,
        this.refShipperAreaId,
    });

    String? addressName;
    String? address1;
    String? address2;
    String? city;
    String? state;
    String? country;
    String? postalCode;
    String? addressTag;
    bool? isPrimary;
    int? refShipperCountryId;
    int? refShipperProvinceId;
    int? refShipperCityId;
    int? refShipperSuburbId;
    int? refShipperAreaId;
    
    Map<String, dynamic> toJson() => {
        "address_name": addressName,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode,
        "address_tag": addressTag,
        "is_primary": isPrimary,
        "ref_shipper_country_id": refShipperCountryId,
        "ref_shipper_province_id": refShipperProvinceId,
        "ref_shipper_city_id": refShipperCityId,
        "ref_shipper_suburb_id": refShipperSuburbId,
        "ref_shipper_area_id": refShipperAreaId,
    };
}
