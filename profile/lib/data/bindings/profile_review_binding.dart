import 'package:get/get.dart';

import '../../presentation/controller/profile_review_controller.dart';

class ProfileReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileReviewController());
  }
}