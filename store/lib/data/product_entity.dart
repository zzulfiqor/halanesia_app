import 'package:store/data/image_entity.dart';

class ProductEntity {
  ProductEntity(
      {required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productStock,
      required this.productImage});

  late final String productId;
  late final String productName;
  late final int productPrice;
  late final int productStock;
  late final List<ProductImageEntity> productImage;

  ProductEntity.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['price'];
    productStock = json['stock'];
    productImage = List<ProductImageEntity>.from(json["product_image"].map((x) => ProductImageEntity.fromJson(x)));
  }
}

class ProductImageEntity {
  ProductImageEntity(
      {required this.imageId,
      required this.imagePath,
    });

  late final String imageId;
  late final String imagePath;

  ProductImageEntity.fromJson(Map<String, dynamic> json) {
    imageId = json['id'];
    imagePath = json['image_path'];
  }
}

