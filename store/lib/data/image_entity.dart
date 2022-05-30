class ImageEntity {
  late String? id;
  late String? status;
  late String? imagePath;

  ImageEntity({required this.id, required this.status});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    return data;
  }

  ImageEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    imagePath = json['image_path'];
  }
}
