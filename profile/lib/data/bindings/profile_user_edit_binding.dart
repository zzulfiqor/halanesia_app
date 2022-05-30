import 'package:get/get.dart';
import 'package:profile/usecase/shipping/get_shipping_area_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_city_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_province_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_suburb_usecase.dart';
import 'package:profile/usecase/user/put_user_profile_usecase.dart';

import '../../presentation/controller/profile_user_edit_controller.dart';
import '../../profile.dart';
import '../../usecase/user/post_user_address_usecase.dart';

class ProfileUserEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PutUserProfileUseCase(Get.find<ProfileRepository>()));
    Get.put(GetShippingProvinceUseCase(Get.find<ProfileRepository>()));
    Get.put(GetShippingCityUseCase(Get.find<ProfileRepository>()));
    Get.put(GetShippingSuburbUseCase(Get.find<ProfileRepository>()));
    Get.put(GetShippingAreaUseCase(Get.find<ProfileRepository>()));
    Get.put(PostUserAddressUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileUserEditController());
  }
}