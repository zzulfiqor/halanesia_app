class ProductReviewEntity {
  ProductReviewEntity(
      {required this.profileImage,
      required this.name,
      required this.rate,
      required this.message,
      required this.listImage,});

  late final String profileImage;
  late final String name;
  late final double rate;
  late final String message;
  late final List<String>? listImage;

  ProductReviewEntity.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    name = json['name'];
    rate = json['rate'];
    message = json['message'];
    listImage = json["list_image"] == null ? null : List<String>.from(json["list_image"].map((x) => x));
  }
}
    

var reviewListData = [
  ProductReviewEntity(
    profileImage: "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
    name: "Nama User",
    rate: 3.6,
    message: "The quick fox jumps over the lazy dog.",
    listImage: []
  ),
  ProductReviewEntity(
    profileImage: "",
    name: "Nama User",
    rate: 3.6,
    message: "The quick fox jumps over the lazy dog.",
    listImage: ["https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
    "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg"]
  ),
    ProductReviewEntity(
    profileImage: "",
    name: "Nama User",
    rate: 3.6,
    message: "",
    listImage: ["https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg"]
  ),
];

var reviewImageData = ProductReviewEntity(
  profileImage: "",
  name: "Nama User",
  rate: 3.6,
  message: "The quick fox jumps over the lazy dog.",
  listImage: [
    "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
    "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
    "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg",
    "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg"]
);