class CartItemModelDataMerchantProductProductDetailImage {
  String? id;
  String? imgUrl;
  int? status;

  CartItemModelDataMerchantProductProductDetailImage({
    this.id,
    this.imgUrl,
    this.status,
  });
  CartItemModelDataMerchantProductProductDetailImage.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    imgUrl = json['img_url']?.toString();
    status = json['status']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['img_url'] = imgUrl;
    data['status'] = status;
    return data;
  }
}

class CartItemModelDataMerchantProductProductDetailPrices {
  String? id;
  int? minOrder;
  int? price;
  String? discountPrice;
  String? currency;
  bool? isDiscount;

  CartItemModelDataMerchantProductProductDetailPrices({
    this.id,
    this.minOrder,
    this.price,
    this.discountPrice,
    this.currency,
    this.isDiscount,
  });
  CartItemModelDataMerchantProductProductDetailPrices.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    minOrder = json['min_order']?.toInt();
    price = json['price']?.toInt();
    discountPrice = json['discount_price']?.toString();
    currency = json['currency']?.toString();
    isDiscount = json['is_discount'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['min_order'] = minOrder;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['currency'] = currency;
    data['is_discount'] = isDiscount;
    return data;
  }
}

class CartItemModelDataMerchantProductProductDetailCart {
  String? id;
  int? qt;
  String? added;

  CartItemModelDataMerchantProductProductDetailCart({
    this.id,
    this.qt,
    this.added,
  });
  CartItemModelDataMerchantProductProductDetailCart.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    qt = json['qt']?.toInt();
    added = json['added']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['qt'] = qt;
    data['added'] = added;
    return data;
  }
}

class CartItemModelDataMerchantProductProductDetail {
  String? id;
  int? stock;
  String? variant;
  String? variantType;
  String? status;
  String? amountSold;
  CartItemModelDataMerchantProductProductDetailCart? cart;
  List<CartItemModelDataMerchantProductProductDetailPrices?>? prices;
  CartItemModelDataMerchantProductProductDetailImage? image;

  CartItemModelDataMerchantProductProductDetail({
    this.id,
    this.stock,
    this.variant,
    this.variantType,
    this.status,
    this.amountSold,
    this.cart,
    this.prices,
    this.image,
  });
  CartItemModelDataMerchantProductProductDetail.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    stock = json['stock']?.toInt();
    variant = json['variant']?.toString();
    variantType = json['variant_type']?.toString();
    status = json['status']?.toString();
    amountSold = json['amount_sold']?.toString();
    cart = (json['cart'] != null)
        ? CartItemModelDataMerchantProductProductDetailCart.fromJson(
            json['cart'])
        : null;
    if (json['prices'] != null) {
      final v = json['prices'];
      final arr0 = <CartItemModelDataMerchantProductProductDetailPrices>[];
      v.forEach((v) {
        arr0.add(
            CartItemModelDataMerchantProductProductDetailPrices.fromJson(v));
      });
      prices = arr0;
    }
    image = (json['image'] != null)
        ? CartItemModelDataMerchantProductProductDetailImage.fromJson(
            json['image'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['stock'] = stock;
    data['variant'] = variant;
    data['variant_type'] = variantType;
    data['status'] = status;
    data['amount_sold'] = amountSold;
    if (cart != null) {
      data['cart'] = cart!.toJson();
    }
    if (prices != null) {
      final v = prices;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['prices'] = arr0;
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class CartItemModelDataMerchantProduct {
  String? name;
  int? minOrder;
  bool? isDeleted;
  List<CartItemModelDataMerchantProductProductDetail?>? productDetail;

  CartItemModelDataMerchantProduct({
    this.name,
    this.minOrder,
    this.isDeleted,
    this.productDetail,
  });
  CartItemModelDataMerchantProduct.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    minOrder = json['min_order']?.toInt();
    isDeleted = json['is_deleted'];
    if (json['product_detail'] != null) {
      final v = json['product_detail'];
      final arr0 = <CartItemModelDataMerchantProductProductDetail>[];
      v.forEach((v) {
        arr0.add(CartItemModelDataMerchantProductProductDetail.fromJson(v));
      });
      productDetail = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['min_order'] = minOrder;
    data['is_deleted'] = isDeleted;
    if (productDetail != null) {
      final v = productDetail;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['product_detail'] = arr0;
    }
    return data;
  }
}

class CartItemModelDataMerchant {
  String? name;
  String? imgUrl;
  bool? isVerified;
  bool? isOfficial;
  List<CartItemModelDataMerchantProduct?>? product;

  CartItemModelDataMerchant({
    this.name,
    this.imgUrl,
    this.isVerified,
    this.isOfficial,
    this.product,
  });
  CartItemModelDataMerchant.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    imgUrl = json['img_url']?.toString();
    isVerified = json['is_verified'];
    isOfficial = json['is_official'];
    if (json['product'] != null) {
      final v = json['product'];
      final arr0 = <CartItemModelDataMerchantProduct>[];
      v.forEach((v) {
        arr0.add(CartItemModelDataMerchantProduct.fromJson(v));
      });
      product = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['img_url'] = imgUrl;
    data['is_verified'] = isVerified;
    data['is_official'] = isOfficial;
    if (product != null) {
      final v = product;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['product'] = arr0;
    }
    return data;
  }
}

class CartItemModelData {
  CartItemModelDataMerchant? merchant;

  CartItemModelData({
    this.merchant,
  });
  CartItemModelData.fromJson(Map<String, dynamic> json) {
    merchant = (json['merchant'] != null)
        ? CartItemModelDataMerchant.fromJson(json['merchant'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (merchant != null) {
      data['merchant'] = merchant!.toJson();
    }
    return data;
  }
}
