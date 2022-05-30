import 'package:get/get.dart';
import 'package:profile/usecase/merchant/get_merchant_info_detail_usecase.dart';
import 'package:profile/usecase/merchant/post_merchant_image_usecase.dart';

import '../../presentation/controller/profile_store_profile_controller.dart';
import '../../profile.dart';

class ProfileStoreProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetMerchantInfoDetailUseCase(Get.find<ProfileRepository>()));
    Get.put(PostMerchantImageUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileStoreProfileController());
  }
}