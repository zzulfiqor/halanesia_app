class GetCouponResponseData {
  String? id;
  String? name;
  String? desc;
  int? price;
  String? expiredAt;

  GetCouponResponseData({
    this.id,
    this.name,
    this.desc,
    this.price,
    this.expiredAt,
  });
  GetCouponResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    desc = json['desc']?.toString();
    price = json['price']?.toInt();
    expiredAt = json['expired_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['desc'] = desc;
    data['price'] = price;
    data['expired_at'] = expiredAt;
    return data;
  }
}
