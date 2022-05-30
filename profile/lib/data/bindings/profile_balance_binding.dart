import 'package:get/get.dart';

import '../../presentation/controller/profile_balance_controller.dart';

class ProfileBalanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileBalanceController());
  }
}