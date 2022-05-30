import 'package:get/get.dart';
import 'package:profile/usecase/merchant/get_merchant_type_usecase.dart';
import 'package:profile/usecase/merchant/post_merchant_register_usecase.dart';

import '../../presentation/controller/profile_store_register_controller.dart';
import '../../profile.dart';

class ProfileStoreRegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetMerchantTypeUseCase(Get.find<ProfileRepository>()));
    Get.put(PostMerchantRegisterUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileStoreRegisterController());
  }
}