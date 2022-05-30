class CheckoutResponseDataPricing {
  int? totalItemsPrice;
  int? shippingPrice;
  int? voucherDiscount;
  int? insurancePrice;
  int? layananPrice;
  int? totalPrice;

  CheckoutResponseDataPricing({
    this.totalItemsPrice,
    this.shippingPrice,
    this.voucherDiscount,
    this.insurancePrice,
    this.layananPrice,
    this.totalPrice,
  });
  CheckoutResponseDataPricing.fromJson(Map<String, dynamic> json) {
    totalItemsPrice = json['total_items_price'] ?? 0;
    shippingPrice = json['shipping_price'] ?? 0;
    voucherDiscount = json['voucher_discount'] ?? 0;
    insurancePrice = json['insurance_price'] ?? 0;
    layananPrice = json['layanan_price'] ?? 0;
    totalPrice = json['total_price']  ?? 0;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_items_price'] = totalItemsPrice;
    data['shipping_price'] = shippingPrice;
    data['voucher_discount'] = voucherDiscount;
    data['insurance_price'] = insurancePrice;
    data['layanan_price'] = layananPrice;
    data['total_price'] = totalPrice;
    return data;
  }
}

class CheckoutResponseDataAddress {
  int? userAddressId;
  String? addressName;
  String? address_1;
  String? address_2;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  int? refShipperProvinceId;
  int? refShipperCityId;
  String? refShipperSuburbId;
  bool? isPrimary;

  CheckoutResponseDataAddress({
    this.userAddressId,
    this.addressName,
    this.address_1,
    this.address_2,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.refShipperProvinceId,
    this.refShipperCityId,
    this.refShipperSuburbId,
    this.isPrimary,
  });
  CheckoutResponseDataAddress.fromJson(Map<String, dynamic> json) {
    userAddressId = json['user_address_id']?.toInt();
    addressName = json['address_name']?.toString();
    address_1 = json['address_1']?.toString();
    address_2 = json['address_2']?.toString();
    city = json['city']?.toString();
    state = json['state']?.toString();
    country = json['country']?.toString();
    postalCode = json['postal_code']?.toString();
    refShipperProvinceId = json['ref_shipper_province_id']?.toInt();
    refShipperCityId = json['ref_shipper_city_id']?.toInt();
    refShipperSuburbId = json['ref_shipper_suburb_id']?.toString();
    isPrimary = json['is_primary'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_address_id'] = userAddressId;
    data['address_name'] = addressName;
    data['address_1'] = address_1;
    data['address_2'] = address_2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postal_code'] = postalCode;
    data['ref_shipper_province_id'] = refShipperProvinceId;
    data['ref_shipper_city_id'] = refShipperCityId;
    data['ref_shipper_suburb_id'] = refShipperSuburbId;
    data['is_primary'] = isPrimary;
    return data;
  }
}

class CheckoutResponseDataProducts {
  String? productId;
  String? productDetailId;
  String? productName;
  String? productDesc;
  int? weight;
  int? dimX;
  int? dimY;
  int? dimZ;
  String? dimUnit;
  int? stock;
  String? variant;
  String? variantType;
  int? price;
  int? finalPrice;
  int? quantity;
  String? currency;
  int? minOrder;
  String? image;

  CheckoutResponseDataProducts({
    this.productId,
    this.productDetailId,
    this.productName,
    this.productDesc,
    this.weight,
    this.dimX,
    this.dimY,
    this.dimZ,
    this.dimUnit,
    this.stock,
    this.variant,
    this.variantType,
    this.price,
    this.finalPrice,
    this.quantity,
    this.currency,
    this.minOrder,
    this.image,
  });
  CheckoutResponseDataProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id']?.toString();
    productDetailId = json['product_detail_id']?.toString();
    productName = json['product_name']?.toString();
    productDesc = json['product_desc']?.toString();
    weight = json['weight']?.toInt();
    dimX = json['dim_x']?.toInt();
    dimY = json['dim_y']?.toInt();
    dimZ = json['dim_z']?.toInt();
    dimUnit = json['dim_unit']?.toString();
    stock = json['stock']?.toInt();
    variant = json['variant']?.toString();
    variantType = json['variant_type']?.toString();
    price = json['price']?.toInt();
    finalPrice = json['final_price']?.toInt();
    quantity = json['quantity']?.toInt();
    currency = json['currency']?.toString();
    minOrder = json['min_order']?.toInt();
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_detail_id'] = productDetailId;
    data['product_name'] = productName;
    data['product_desc'] = productDesc;
    data['weight'] = weight;
    data['dim_x'] = dimX;
    data['dim_y'] = dimY;
    data['dim_z'] = dimZ;
    data['dim_unit'] = dimUnit;
    data['stock'] = stock;
    data['variant'] = variant;
    data['variant_type'] = variantType;
    data['price'] = price;
    data['final_price'] = finalPrice;
    data['quantity'] = quantity;
    data['currency'] = currency;
    data['min_order'] = minOrder;
    data['image'] = image;
    return data;
  }
}

class CheckoutResponseDataMerchant {
  int? id;
  String? name;
  bool? isOfficial;
  bool? isVerified;
  String? statusDesc;

  CheckoutResponseDataMerchant({
    this.id,
    this.name,
    this.isOfficial,
    this.isVerified,
    this.statusDesc,
  });
  CheckoutResponseDataMerchant.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    isOfficial = json['is_official'];
    isVerified = json['is_verified'];
    statusDesc = json['status_desc']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_official'] = isOfficial;
    data['is_verified'] = isVerified;
    data['status_desc'] = statusDesc;
    return data;
  }
}

class CheckoutResponseDataCoupon {
  String? id;
  String? name;
  int? couponPrice;

  CheckoutResponseDataCoupon({
    this.id,
    this.name,
    this.couponPrice,
  });
  CheckoutResponseDataCoupon.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    couponPrice = json['coupon_price']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coupon_price'] = couponPrice;
    return data;
  }
}

class CheckoutResponseData {
  CheckoutResponseDataCoupon? coupon;
  CheckoutResponseDataMerchant? merchant;
  List<CheckoutResponseDataProducts?>? products;
  String? shipping;
  List<CheckoutResponseDataAddress?>? address;
  CheckoutResponseDataPricing? pricing;

  CheckoutResponseData({
    this.coupon,
    this.merchant,
    this.products,
    this.shipping,
    this.address,
    this.pricing,
  });
  CheckoutResponseData.fromJson(Map<String, dynamic> json) {
    coupon = (json['coupon'] != null)
        ? CheckoutResponseDataCoupon.fromJson(json['coupon'])
        : null;
    merchant = (json['merchant'] != null)
        ? CheckoutResponseDataMerchant.fromJson(json['merchant'])
        : null;
    if (json['products'] != null) {
      final v = json['products'];
      final arr0 = <CheckoutResponseDataProducts>[];
      v.forEach((v) {
        arr0.add(CheckoutResponseDataProducts.fromJson(v));
      });
      products = arr0;
    }
    shipping = json['shipping']?.toString();
    if (json['address'] != null) {
      final v = json['address'];
      final arr0 = <CheckoutResponseDataAddress>[];
      v.forEach((v) {
        arr0.add(CheckoutResponseDataAddress.fromJson(v));
      });
      address = arr0;
    }
    pricing = (json['pricing'] != null)
        ? CheckoutResponseDataPricing.fromJson(json['pricing'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    if (merchant != null) {
      data['merchant'] = merchant!.toJson();
    }
    if (products != null) {
      final v = products;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['products'] = arr0;
    }
    data['shipping'] = shipping;
    if (address != null) {
      final v = address;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['address'] = arr0;
    }
    if (pricing != null) {
      data['pricing'] = pricing!.toJson();
    }
    return data;
  }
}
