
class AddCartResponseData {

  String? status;
  int? cartId;
  String? remark;

  AddCartResponseData({
    this.status,
    this.cartId,
    this.remark,
  });
  AddCartResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    cartId = json['cart_id']?.toInt();
    remark = json['remark']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['cart_id'] = cartId;
    data['remark'] = remark;
    return data;
  }
}
