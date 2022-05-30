import 'package:get/get.dart';

import 'package:profile/presentation/controller/profile_controller.dart';
import 'package:profile/profile.dart';
import 'package:profile/usecase/user/get_user_info_usecase.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetUserInfoUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileController());
  }
}