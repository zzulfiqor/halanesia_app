import 'dart:developer';

import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:home/controller/home_controller.dart';
import 'package:profile/usecase/user/get_user_info_usecase.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../data/response/user_info_response.dart';

class ProfileController extends BaseController {
  late final GetUserInfoUseCase getUserInfoUseCase;
  late PackageInfo packageInfo;

  var hasMerchant = false.obs;
  var isLoading = false.obs;

  var name = "".obs;
  var image = "".obs;
  var email = "".obs;

  @override
  void onInit() {
    super.onInit();
    getUserInfoUseCase = Get.find<GetUserInfoUseCase>();
    packageInfoGet();
    getData();
    getProfile();
  }

  Future<void> packageInfoGet() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  void getData() {
    name.value = cacheManager.getNameUser();
    image.value = cacheManager.getImageUser();
    email.value = cacheManager.getEmailUser();
    hasMerchant.value = cacheManager.getHasMerchant();
  }

  void logout() {
    cacheManager.clearAll();
    Get.find<HomeController>().setBottomNavbarIndex(0);
    Get.offAllNamed(RouteName.login);
  }

  void getProfile() async {
    isLoading.value = true;

    final response = await getUserInfoUseCase();

    safeCallApi<UserInfoResponse>(response,
        onLoad: (status) => isLoading.value = status,
        onSuccess: (response) {
          name.value = response?.fullname ?? "";
          image.value = response?.imgPath ?? "";
          email.value = response?.email ?? "";

          hasMerchant.value = response?.hasMerchant ?? false;

          cacheManager.saveBasicProfile(name.value, image.value, email.value,
              response?.phone ?? "-", hasMerchant.value);

          //Todo: ask for province, city, suburb
          log("Ref Shipper Suburb id = ${response?.address?.refShipperSuburbId}");
          cacheManager.saveAddressUser(
            response?.address?.address1 ?? "-",
            response?.address?.address2 ?? "-",
            response?.address?.city ?? "",
            response?.address?.state ?? "",
            response?.address?.country ?? "",
            response?.address?.postalCode ?? "",
            response?.address?.refShipperCountryId ?? 0,
            response?.address?.refShipperProvinceId ?? 0,
            response?.address?.refShipperCityId ?? 0,
            response?.address?.refShipperSuburbId ?? 0,
            response?.address?.refShipperAreaId ?? 0,
          );
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isLoading.value = false;
  }
}
