import 'package:get/get.dart';

import '../../presentation/controller/profile_product_controller.dart';

class ProfileProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileProductController());
  }
}