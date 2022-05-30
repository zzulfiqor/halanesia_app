import 'package:get/get.dart';
import 'package:store/controller/product_review_all_image_controller.dart';
import 'package:store/usecases/get_product_review_image_usecase.dart';

class ProductReviewAllImageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetProductReviewImageUseCase(Get.find()));
    Get.put(ProductReviewAllImageController());
  }
}
