import 'package:get/get.dart';
import 'package:storefront/controller/merchant_review_controller.dart';
import 'package:storefront/usecases/get_merchant_review_usecase.dart';

class MerchantReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetMerchantReviewUseCase(Get.find()));
    Get.lazyPut(() => MerchantReviewController());
  }
}
