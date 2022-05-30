import 'package:get/get.dart';
import 'package:store/controller/product_detail_controller.dart';
import 'package:store/usecases/get_product_detail_usecase.dart';
import 'package:store/usecases/get_product_related_usecase.dart';
import 'package:store/usecases/get_product_review_image_usecase.dart';
import 'package:store/usecases/get_product_review_usecase.dart';
import 'package:store/usecases/post_add_cart_usecase.dart';
import 'package:store/usecases/post_checkout_usecase.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetProductDetailUseCase(Get.find()));
    Get.put(GetProductRelatedUseCase(Get.find()));
    Get.put(GetProductReviewUseCase(Get.find()));
    Get.put(GetProductReviewImageUseCase(Get.find()));
    Get.put(PostAddCartUseCase(Get.find()));
    Get.put(PostCheckoutUseCase(Get.find()));

    Get.put(ProductDetailController());
  }
}
