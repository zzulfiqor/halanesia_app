import 'package:store/data/image_entity.dart';

class AddProductRequest {
  String productName;
  int productCategoryId;
  int minOrder;
  int price;
  int stock;
  int weight;
  String weightUnit;
  int dimX;
  int dimY;
  int dimZ;
  String dimUnit;
  List<int> productImage;
  int? id;

  AddProductRequest(
      {required this.productName,
      required this.productCategoryId,
      required this.minOrder,
      required this.price,
      required this.stock,
      required this.weight,
      required this.weightUnit,
      required this.dimX,
      required this.dimY,
      required this.dimZ,
      required this.dimUnit,
      required this.productImage,
      this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['product_category_id'] = productCategoryId;
    data['min_order'] = minOrder;
    data['price'] = price;
    data['stock'] = stock;
    data['weight'] = weight;
    data['weight_unit'] = weightUnit;
    data['dim_x'] = dimX;
    data['dim_y'] = dimY;
    data['dim_z'] = dimZ;
    data['dim_unit'] = dimUnit;
    data['product_image'] = productImage;
    return data;
  }
}