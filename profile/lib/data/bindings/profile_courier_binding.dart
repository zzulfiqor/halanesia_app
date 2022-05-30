import 'package:get/get.dart';
import 'package:profile/usecase/shipping/get_shipping_option_usecase.dart';
import 'package:profile/usecase/shipping/put_shipping_option_usecase.dart';

import '../../presentation/controller/profile_courier_controller.dart';
import '../../profile.dart';

class ProfileCourierBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetShippingOptionUseCase(Get.find<ProfileRepository>()));
    Get.put(PutShippingOptionUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileCourierController());
  }
}