class ImageUploadResponse {
  ImageUploadResponse({
    required this.imageId,
    required this.imagePath
  });

  late final int imageId;
  late final String imagePath;

  ImageUploadResponse.fromJson(Map<String, dynamic> json) {
    imageId = json['product_image_id'];
    imagePath = json['image_path'];
  }
}
