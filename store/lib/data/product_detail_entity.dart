class ProductDetailEntity {
  ProductDetailEntity(
      {required this.productName,
      required this.productPrice,
      required this.productRate,
      required this.productImage});

  late final String productName;
  late final int productPrice;
  late final double productRate;
  late final String productImage;

  ProductDetailEntity.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productPrice = json['product_price'];
    productRate = json['product_rate'];
    productImage = json['product_image'];
  }
}

var imageList = [
  ProductDetailEntity(
    productName: "Pena Kayu dan Pena Plastik",
    productPrice: 200000,
    productRate: 3.6,
    productImage: "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg"
  ),
  ProductDetailEntity(
    productName: "Pena Kayu dan Pena Plastik",
    productPrice: 200000,
    productRate: 3.6,
    productImage: "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg"
  ),
  ProductDetailEntity(
    productName: "Pena Kayu dan Pena Plastik",
    productPrice: 200000,
    productRate: 3.6,
    productImage: "https://www.publicdomainpictures.net/pictures/390000/nahled/image-1614231152FSV.jpg"
  ),
];