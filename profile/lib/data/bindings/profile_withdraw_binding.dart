import 'package:get/get.dart';

import '../../presentation/controller/profile_withdraw_controller.dart';

class ProfileWithdrawBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileWithdrawController());
  }
}