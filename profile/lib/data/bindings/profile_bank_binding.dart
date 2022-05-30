import 'package:get/get.dart';
import 'package:profile/usecase/merchant/get_merchant_bank_list_usecase.dart';
import 'package:profile/usecase/merchant/post_merchant_bank_usecase.dart';

import '../../presentation/controller/profile_bank_controller.dart';
import '../../profile.dart';

class ProfileBankBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetMerchantBankListUseCase(Get.find<ProfileRepository>()));
    Get.put(PostMerchantBankUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileBankController());
  }
}