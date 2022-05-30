import 'package:get/get.dart';
import 'package:profile/usecase/merchant/get_merchant_type_usecase.dart';
import 'package:profile/usecase/merchant/put_merchant_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_area_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_city_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_province_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_suburb_usecase.dart';

import '../../presentation/controller/profile_store_edit_controller.dart';
import '../../repository/profile_repository.dart';

class ProfileStoreEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetMerchantTypeUseCase(Get.find<ProfileRepository>()));
    Get.put(GetShippingProvinceUseCase(Get.find<ProfileRepository>()));
    Get.put(GetShippingCityUseCase(Get.find<ProfileRepository>()));
    Get.put(GetShippingSuburbUseCase(Get.find<ProfileRepository>()));
    Get.put(GetShippingAreaUseCase(Get.find<ProfileRepository>()));
    Get.put(PutMerchantUseCase(Get.find<ProfileRepository>()));
    Get.put(ProfileStoreEditController());
  }
}