import 'package:get/get.dart';
import 'package:profile/usecase/merchant/get_merchant_info_usecase.dart';
import 'package:profile/usecase/merchant/get_merchant_workhour_usecase.dart';
import 'package:profile/usecase/merchant/put_merchant_status_usecase.dart';
import 'package:profile/usecase/merchant/put_merchant_workhour_usecase.dart';
import '../../presentation/controller/profile_store_controller.dart';
import '../../profile.dart';

class ProfileStoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetMerchantInfoUseCase(Get.find<ProfileRepository>()));
    Get.put(PutMerchantStatusUseCase(Get.find<ProfileRepository>()));
    Get.put(GetMerchantWorkhourUseCase(Get.find<ProfileRepository>()));
    Get.put(PutMerchantWorkhourUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileStoreController());
  }
}