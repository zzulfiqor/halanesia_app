import 'package:get/get.dart';
import 'package:store/controller/product_review_image_controller.dart';

class ProductReviewImageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductReviewImageController());
  }
}
