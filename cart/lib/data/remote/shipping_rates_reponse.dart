class ShippingRatesResponseDataPricingsLogisticsDetailRates {
  int? weight;
  int? volume;
  double? volumeWeight;
  int? finalWeight;
  int? minDay;
  int? maxDay;
  int? unitPrice;
  int? totalPrice;
  int? discount;
  int? discountValue;
  int? discountedPrice;
  int? insuranceFee;
  bool? mustUseInsurance;
  int? liabilityValue;
  int? finalPrice;
  String? currency;
  bool? insuranceApplied;

  ShippingRatesResponseDataPricingsLogisticsDetailRates({
    this.weight,
    this.volume,
    this.volumeWeight,
    this.finalWeight,
    this.minDay,
    this.maxDay,
    this.unitPrice,
    this.totalPrice,
    this.discount,
    this.discountValue,
    this.discountedPrice,
    this.insuranceFee,
    this.mustUseInsurance,
    this.liabilityValue,
    this.finalPrice,
    this.currency,
    this.insuranceApplied,
  });
  ShippingRatesResponseDataPricingsLogisticsDetailRates.fromJson(
      Map<String, dynamic> json) {
    weight = json['weight']?.toInt();
    volume = json['volume']?.toInt();
    volumeWeight = json['volume_weight']?.toDouble();
    finalWeight = json['final_weight']?.toInt();
    minDay = json['min_day']?.toInt();
    maxDay = json['max_day']?.toInt();
    unitPrice = json['unit_price']?.toInt();
    totalPrice = json['total_price']?.toInt();
    discount = json['discount']?.toInt();
    discountValue = json['discount_value']?.toInt();
    discountedPrice = json['discounted_price']?.toInt();
    insuranceFee = json['insurance_fee']?.toInt();
    mustUseInsurance = json['must_use_insurance'];
    liabilityValue = json['liability_value']?.toInt();
    finalPrice = json['final_price']?.toInt();
    currency = json['currency']?.toString();
    insuranceApplied = json['insurance_applied'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['weight'] = weight;
    data['volume'] = volume;
    data['volume_weight'] = volumeWeight;
    data['final_weight'] = finalWeight;
    data['min_day'] = minDay;
    data['max_day'] = maxDay;
    data['unit_price'] = unitPrice;
    data['total_price'] = totalPrice;
    data['discount'] = discount;
    data['discount_value'] = discountValue;
    data['discounted_price'] = discountedPrice;
    data['insurance_fee'] = insuranceFee;
    data['must_use_insurance'] = mustUseInsurance;
    data['liability_value'] = liabilityValue;
    data['final_price'] = finalPrice;
    data['currency'] = currency;
    data['insurance_applied'] = insuranceApplied;
    return data;
  }
}

class ShippingRatesResponseDataPricingsLogisticsDetail {
  int? id;
  int? shipperId;
  String? name;
  String? type;
  String? description;
  String? fullDescription;
  ShippingRatesResponseDataPricingsLogisticsDetailRates? rates;

  ShippingRatesResponseDataPricingsLogisticsDetail({
    this.id,
    this.shipperId,
    this.name,
    this.type,
    this.description,
    this.fullDescription,
    this.rates,
  });
  ShippingRatesResponseDataPricingsLogisticsDetail.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toInt();
    shipperId = json['shipper_id']?.toInt();
    name = json['name']?.toString();
    type = json['type']?.toString();
    description = json['description']?.toString();
    fullDescription = json['full_description']?.toString();
    rates = (json['rates'] != null)
        ? ShippingRatesResponseDataPricingsLogisticsDetailRates.fromJson(
            json['rates'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['shipper_id'] = shipperId;
    data['name'] = name;
    data['type'] = type;
    data['description'] = description;
    data['full_description'] = fullDescription;
    if (rates != null) {
      data['rates'] = rates!.toJson();
    }
    return data;
  }
}

class ShippingRatesResponseDataPricingsLogistics {
  int? id;
  int? shipperId;
  String? name;
  String? imgUrl;
  String? companyName;
  String? code;
  ShippingRatesResponseDataPricingsLogisticsDetail? detail;

  ShippingRatesResponseDataPricingsLogistics({
    this.id,
    this.shipperId,
    this.name,
    this.imgUrl,
    this.companyName,
    this.code,
    this.detail,
  });
  ShippingRatesResponseDataPricingsLogistics.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toInt();
    shipperId = json['shipper_id']?.toInt();
    name = json['name']?.toString();
    imgUrl = json['img_url']?.toString();
    companyName = json['company_name']?.toString();
    code = json['code']?.toString();
    detail = (json['detail'] != null)
        ? ShippingRatesResponseDataPricingsLogisticsDetail.fromJson(
            json['detail'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['shipper_id'] = shipperId;
    data['name'] = name;
    data['img_url'] = imgUrl;
    data['company_name'] = companyName;
    data['code'] = code;
    if (detail != null) {
      data['detail'] = detail!.toJson();
    }
    return data;
  }
}

class ShippingRatesResponseDataPricings {
  String? type;
  List<ShippingRatesResponseDataPricingsLogistics?>? logistics;

  ShippingRatesResponseDataPricings({
    this.type,
    this.logistics,
  });
  ShippingRatesResponseDataPricings.fromJson(Map<String, dynamic> json) {
    type = json['type']?.toString();
    if (json['logistics'] != null) {
      final v = json['logistics'];
      final arr0 = <ShippingRatesResponseDataPricingsLogistics>[];
      v.forEach((v) {
        arr0.add(ShippingRatesResponseDataPricingsLogistics.fromJson(v));
      });
      logistics = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    if (logistics != null) {
      final v = logistics;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['logistics'] = arr0;
    }
    return data;
  }
}

class ShippingRatesResponseDataDestination {
  int? areaId;
  String? areaName;
  int? suburbId;
  String? suburbName;
  int? cityId;
  String? cityName;
  int? provinceId;
  String? provinceName;
  int? countryId;
  String? countryName;
  double? lat;
  double? lng;

  ShippingRatesResponseDataDestination({
    this.areaId,
    this.areaName,
    this.suburbId,
    this.suburbName,
    this.cityId,
    this.cityName,
    this.provinceId,
    this.provinceName,
    this.countryId,
    this.countryName,
    this.lat,
    this.lng,
  });
  ShippingRatesResponseDataDestination.fromJson(Map<String, dynamic> json) {
    areaId = json['area_id']?.toInt();
    areaName = json['area_name']?.toString();
    suburbId = json['suburb_id']?.toInt();
    suburbName = json['suburb_name']?.toString();
    cityId = json['city_id']?.toInt();
    cityName = json['city_name']?.toString();
    provinceId = json['province_id']?.toInt();
    provinceName = json['province_name']?.toString();
    countryId = json['country_id']?.toInt();
    countryName = json['country_name']?.toString();
    lat = json['lat']?.toDouble();
    lng = json['lng']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['area_id'] = areaId;
    data['area_name'] = areaName;
    data['suburb_id'] = suburbId;
    data['suburb_name'] = suburbName;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['province_id'] = provinceId;
    data['province_name'] = provinceName;
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class ShippingRatesResponseDataOrigin {
  int? areaId;
  String? areaName;
  int? suburbId;
  String? suburbName;
  int? cityId;
  String? cityName;
  int? provinceId;
  String? provinceName;
  int? countryId;
  String? countryName;
  double? lat;
  double? lng;

  ShippingRatesResponseDataOrigin({
    this.areaId,
    this.areaName,
    this.suburbId,
    this.suburbName,
    this.cityId,
    this.cityName,
    this.provinceId,
    this.provinceName,
    this.countryId,
    this.countryName,
    this.lat,
    this.lng,
  });
  ShippingRatesResponseDataOrigin.fromJson(Map<String, dynamic> json) {
    areaId = json['area_id']?.toInt();
    areaName = json['area_name']?.toString();
    suburbId = json['suburb_id']?.toInt();
    suburbName = json['suburb_name']?.toString();
    cityId = json['city_id']?.toInt();
    cityName = json['city_name']?.toString();
    provinceId = json['province_id']?.toInt();
    provinceName = json['province_name']?.toString();
    countryId = json['country_id']?.toInt();
    countryName = json['country_name']?.toString();
    lat = json['lat']?.toDouble();
    lng = json['lng']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['area_id'] = areaId;
    data['area_name'] = areaName;
    data['suburb_id'] = suburbId;
    data['suburb_name'] = suburbName;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['province_id'] = provinceId;
    data['province_name'] = provinceName;
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class ShippingRatesResponseData {
  ShippingRatesResponseDataOrigin? origin;
  ShippingRatesResponseDataDestination? destination;
  List<ShippingRatesResponseDataPricings?>? pricings;

  ShippingRatesResponseData({
    this.origin,
    this.destination,
    this.pricings,
  });
  ShippingRatesResponseData.fromJson(Map<String, dynamic> json) {
    origin = (json['origin'] != null)
        ? ShippingRatesResponseDataOrigin.fromJson(json['origin'])
        : null;
    destination = (json['destination'] != null)
        ? ShippingRatesResponseDataDestination.fromJson(json['destination'])
        : null;
    if (json['pricings'] != null) {
      final v = json['pricings'];
      final arr0 = <ShippingRatesResponseDataPricings>[];
      v.forEach((v) {
        arr0.add(ShippingRatesResponseDataPricings.fromJson(v));
      });
      pricings = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    if (destination != null) {
      data['destination'] = destination!.toJson();
    }
    if (pricings != null) {
      final v = pricings;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['pricings'] = arr0;
    }
    return data;
  }
}
