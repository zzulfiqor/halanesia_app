import 'package:core/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:store/data/product_review_image_response.dart';

class ProductReviewImageController extends BaseController {
  
  var imageData = ReviewImageItem().obs;

  @override
  void onInit() {
    super.onInit();

    imageData.value = ReviewImageItem.fromJson(Get.arguments);
  }

}
