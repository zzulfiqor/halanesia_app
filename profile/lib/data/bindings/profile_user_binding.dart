import 'package:get/get.dart';
import 'package:profile/usecase/user/put_user_image_profile_usecase.dart';

import '../../presentation/controller/profile_user_controller.dart';
import '../../profile.dart';

class ProfileUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PutUserImageProfileUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileUserController());
  }
}