
class WishlistResponseDataItemsMerchant {


  String? name;
  String? image;
  bool? isVerified;
  bool? isOfficial;

  WishlistResponseDataItemsMerchant({
    this.name,
    this.image,
    this.isVerified,
    this.isOfficial,
  });
  WishlistResponseDataItemsMerchant.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    image = json['image']?.toString();
    isVerified = json['is_verified'];
    isOfficial = json['is_official'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['is_verified'] = isVerified;
    data['is_official'] = isOfficial;
    return data;
  }
}

class WishlistResponseDataItemsProductPrice {


  String? productPriceId;
  int? minOrder;
  int? price;
  String? discountPrice;
  String? currency;
  String? isDiscount;

  WishlistResponseDataItemsProductPrice({
    this.productPriceId,
    this.minOrder,
    this.price,
    this.discountPrice,
    this.currency,
    this.isDiscount,
  });
  WishlistResponseDataItemsProductPrice.fromJson(Map<String, dynamic> json) {
    productPriceId = json['product_price_id']?.toString();
    minOrder = json['min_order']?.toInt();
    price = json['price']?.toInt();
    discountPrice = json['discount_price']?.toString();
    currency = json['currency']?.toString();
    isDiscount = json['is_discount']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product_price_id'] = productPriceId;
    data['min_order'] = minOrder;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['currency'] = currency;
    data['is_discount'] = isDiscount;
    return data;
  }
}

class WishlistResponseDataItemsProduct {

  String? productId;
  String? productDetailId;
  String? productName;
  int? minOrder;
  bool? isDeleted;
  int? stock;
  String? variant;
  String? variantType;
  String? status;
  String? amountSold;
  List<WishlistResponseDataItemsProductPrice?>? price;
  String? image;

  WishlistResponseDataItemsProduct({
    this.productId,
    this.productDetailId,
    this.productName,
    this.minOrder,
    this.isDeleted,
    this.stock,
    this.variant,
    this.variantType,
    this.status,
    this.amountSold,
    this.price,
    this.image,
  });
  WishlistResponseDataItemsProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id']?.toString();
    productDetailId = json['product_detail_id']?.toString();
    productName = json['product_name']?.toString();
    minOrder = json['min_order']?.toInt();
    isDeleted = json['is_deleted'];
    stock = json['stock']?.toInt();
    variant = json['variant']?.toString();
    variantType = json['variant_type']?.toString();
    status = json['status']?.toString();
    amountSold = json['amount_sold']?.toString();
  if (json['price'] != null) {
  final v = json['price'];
  final arr0 = <WishlistResponseDataItemsProductPrice>[];
  v.forEach((v) {
  arr0.add(WishlistResponseDataItemsProductPrice.fromJson(v));
  });
    price = arr0;
    }
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_detail_id'] = productDetailId;
    data['product_name'] = productName;
    data['min_order'] = minOrder;
    data['is_deleted'] = isDeleted;
    data['stock'] = stock;
    data['variant'] = variant;
    data['variant_type'] = variantType;
    data['status'] = status;
    data['amount_sold'] = amountSold;
    if (price != null) {
      final v = price;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['price'] = arr0;
    }
    data['image'] = image;
    return data;
  }
}

class WishlistResponseDataItems {

  String? id;
  String? addedDate;
  String? updatedDate;
  WishlistResponseDataItemsProduct? product;
  WishlistResponseDataItemsMerchant? merchant;

  WishlistResponseDataItems({
    this.id,
    this.addedDate,
    this.updatedDate,
    this.product,
    this.merchant,
  });
  WishlistResponseDataItems.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    addedDate = json['added_date']?.toString();
    updatedDate = json['updated_date']?.toString();
    product = (json['product'] != null) ? WishlistResponseDataItemsProduct.fromJson(json['product']) : null;
    merchant = (json['merchant'] != null) ? WishlistResponseDataItemsMerchant.fromJson(json['merchant']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['added_date'] = addedDate;
    data['updated_date'] = updatedDate;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (merchant != null) {
      data['merchant'] = merchant!.toJson();
    }
    return data;
  }
}

class WishlistResponseData {

  int? currentItems;
  int? totalItems;
  int? currentPage;
  int? totalPages;
  List<WishlistResponseDataItems?>? items;

  WishlistResponseData({
    this.currentItems,
    this.totalItems,
    this.currentPage,
    this.totalPages,
    this.items,
  });
  WishlistResponseData.fromJson(Map<String, dynamic> json) {
    currentItems = json['currentItems']?.toInt();
    totalItems = json['totalItems']?.toInt();
    currentPage = json['currentPage']?.toInt();
    totalPages = json['totalPages']?.toInt();
  if (json['items'] != null) {
  final v = json['items'];
  final arr0 = <WishlistResponseDataItems>[];
  v.forEach((v) {
  arr0.add(WishlistResponseDataItems.fromJson(v));
  });
    items = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['currentItems'] = currentItems;
    data['totalItems'] = totalItems;
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    if (items != null) {
      final v = items;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['items'] = arr0;
    }
    return data;
  }
}

