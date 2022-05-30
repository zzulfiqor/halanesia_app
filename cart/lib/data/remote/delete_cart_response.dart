
class DeleteCartResponseData {

  String? status;
  int? count;
  String? remark;

  DeleteCartResponseData({
    this.status,
    this.count,
    this.remark,
  });
  DeleteCartResponseData.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    count = json['count']?.toInt();
    remark = json['remark']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['count'] = count;
    data['remark'] = remark;
    return data;
  }
}
