import 'package:get/get.dart';
import 'package:store/controller/product_review_controller.dart';
import 'package:store/usecases/get_product_review_usecase.dart';

class ProductReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetProductReviewUseCase(Get.find()));
    Get.put(ProductReviewController());
  }
}
