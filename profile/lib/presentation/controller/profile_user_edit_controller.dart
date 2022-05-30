import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/usecase/shipping/get_shipping_area_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_city_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_province_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_suburb_usecase.dart';
import 'package:profile/usecase/user/put_user_address_usecase.dart';
import 'package:profile/usecase/user/put_user_profile_usecase.dart';

import '../../data/request/user_address_request.dart';
import '../../data/request/user_info_request.dart';
import '../../data/response/shipping_area_response.dart';
import '../../data/response/shipping_city_response.dart';
import '../../data/response/shipping_country_data.dart';
import '../../data/response/shipping_location_data.dart';
import '../../data/response/shipping_province_response.dart';
import '../../data/response/shipping_suburb_response.dart';
import '../../data/response/user_address_data.dart';
import '../../data/response/user_info_response.dart';
import '../../usecase/user/post_user_address_usecase.dart';

class ProfileUserEditController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final PutUserProfileUseCase putUserProfileUseCase;
  late final GetShippingProvinceUseCase getShippingProvinceUseCase;
  late final GetShippingCityUseCase getShippingCityUseCase;
  late final GetShippingSuburbUseCase getShippingSuburbUseCase;
  late final GetShippingAreaUseCase getShippingAreaUseCase;
  late final PostUserAddressUseCase postUserAddressUseCase;
  late final PutUserAddressUseCase putUserAddressUseCase;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var addressNoteController = TextEditingController();
  var phoneController = TextEditingController();

  var name = "".obs;
  var email = "".obs;
  var address = "".obs;
  var addressNote = "".obs;
  var phone = "".obs;

  var isSubmitLoading = false.obs;
  var isInit = true;

  late final ShippingCountry country;
  var selectedProvinces = Rxn<ShippingLocation>();
  var selectedCities = Rxn<ShippingLocation>();
  var selectedSuburbs = Rxn<ShippingLocation>();
  var selectedAreas = Rxn<ShippingLocation>();
  var selectedPostcodes = Rxn<ShippingLocation>();

  var listProvinces = <ShippingLocation>[].obs;
  var listCities = <ShippingLocation>[].obs;
  var listSuburbs = <ShippingLocation>[].obs;
  var listAreas = <ShippingLocation>[].obs;
  var listPostcodes = <ShippingLocation>[].obs;

  var isProvinceLoading = false.obs;
  var isCityLoading = false.obs;
  var isSuburbLoading = false.obs;
  var isAreaLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    putUserProfileUseCase = Get.find<PutUserProfileUseCase>();
    getShippingProvinceUseCase = Get.find<GetShippingProvinceUseCase>();
    getShippingCityUseCase = Get.find<GetShippingCityUseCase>();
    getShippingSuburbUseCase = Get.find<GetShippingSuburbUseCase>();
    getShippingAreaUseCase = Get.find<GetShippingAreaUseCase>();
    postUserAddressUseCase = Get.find<PostUserAddressUseCase>();
    // putUserAddressUseCase = Get.find<PutUserAddressUseCase>();

    nameController.text = cacheManager.getNameUser();
    emailController.text = cacheManager.getEmailUser();

    if (cacheManager.getAddressUser().isNotEmpty) {
      addressController.text = cacheManager.getAddressUser();
    }
    if (cacheManager.getAddressNoteUser().isNotEmpty) {
      addressNoteController.text = cacheManager.getAddressNoteUser();
    }
    if (cacheManager.getPhoneUser().isNotEmpty) {
      phoneController.text = cacheManager.getPhoneUser();
    }

    selectedProvinces.value = null;
    selectedCities.value = null;
    selectedSuburbs.value = null;
    selectedAreas.value = null;
    selectedPostcodes.value = null;

    getProvinces();
  }

  void getProvinces() async {
    isProvinceLoading.value = true;

    final response = await getShippingProvinceUseCase();

    safeCallApi<ShippingProvinceResponse>(response,
        onLoad: (status) => isProvinceLoading.value = status,
        onSuccess: (response) {
          country = response!.country!;
          listProvinces.value = response.provinces!;
          if (isInit) {
            setShipping();
          }
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });
    isProvinceLoading.value = false;
  }

  void setShipping() async {
    var provId = cacheManager.getProvinceIdUser();
    if (provId != 0) {
      for (var prov in listProvinces.value) {
        if (prov.id == provId) {
          selectedProvinces.value = prov;
        }
      }
      final response = await getShippingCityUseCase(provId);

      safeCallApi<ShippingCityResponse>(response,
          onLoad: (status) => isCityLoading.value = status,
          onSuccess: (response) {
            listCities.value = response!.cities!;
            var cityId = cacheManager.getCityIdUser();
            if (cityId != 0) {
              for (var c in listCities.value) {
                if (c.id == cityId) {
                  selectedCities.value = c;
                }
              }
              getSuburbs(cityId);
              isInit = false;
            }
          },
          onError: (code, message) {
            commonDialog.showCommonDialog(message);
          });
    }
    isInit = false;
  }

  void getCities(int id) async {
    isCityLoading.value = true;

    selectedCities.value = null;
    selectedSuburbs.value = null;
    selectedAreas.value = null;
    selectedPostcodes.value = null;

    final response = await getShippingCityUseCase(id);

    safeCallApi<ShippingCityResponse>(response,
        onLoad: (status) => isCityLoading.value = status,
        onSuccess: (response) {
          listCities.value = response!.cities!;
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isCityLoading.value = false;
  }

  void getSuburbs(int id) async {
    isSuburbLoading.value = true;

    selectedSuburbs.value = null;
    selectedAreas.value = null;
    selectedPostcodes.value = null;

    var suburbId = cacheManager.getSuburbIdUser();

    final response = await getShippingSuburbUseCase(id);

    safeCallApi<ShippingSuburbResponse>(response,
        onLoad: (status) => isSuburbLoading.value = status,
        onSuccess: (response) {
          listSuburbs.value = response!.suburbs!;
          if (suburbId != 0) {
            for (var s in listSuburbs) {
              if (s.id == suburbId) {
                selectedSuburbs.value = s;
              }
            }
            getAreas(suburbId);
            isInit = false;
          }
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isSuburbLoading.value = false;
  }

  void getAreas(int id) async {
    isAreaLoading.value = true;

    selectedAreas.value = null;
    selectedPostcodes.value = null;

    var areaId = cacheManager.getAreaIdUser();

    final response = await getShippingAreaUseCase(id);

    safeCallApi<ShippingAreaResponse>(response,
        onLoad: (status) => isAreaLoading.value = status,
        onSuccess: (response) {
          listAreas.value = response!.areas!;
          log(areaId.toString());
          if (areaId != 0) {
            for (var a in listAreas) {
              if (a.id == areaId) {
                selectedAreas.value = a;
              }
            }
            getPostCode(selectedAreas.value!);
            isInit = false;
          }
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isAreaLoading.value = false;
  }

  void getPostCode(ShippingLocation area) {
    if (selectedAreas.value?.id != 0) {
      listPostcodes.value = <ShippingLocation>[selectedAreas.value!];
      selectedPostcodes.value = selectedAreas.value;
    } else {
      listPostcodes.value = <ShippingLocation>[area];
    }
  }

  void submit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    // submit loading
    isSubmitLoading.value = true;

    var body = UserInfoRequest(
      fullname: name.value,
      email: email.value,
      phone: phone.value,
    );

    final response = await putUserProfileUseCase(body);
    // final response = await putUserAddressUseCase(body, );

    safeCallApi<UserInfoResponse>(response,
        onLoad: (status) => isSubmitLoading.value = status,
        onSuccess: (response) {
          cacheManager.savePhoneUser(response?.phone ?? "");
          postAddress();
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isSubmitLoading.value = false;
  }

  void postAddress() async {
    isSubmitLoading.value = true;

    print(address);
    print(addressNote);
    print(selectedProvinces.value!.name);
    print(selectedCities.value!.name);
    print(selectedSuburbs.value!.name);
    print(selectedAreas.value!.name);
    print(selectedPostcodes.value!.postcode);

    var body = UserAddressRequest(
      addressName: "Rumah",
      address1: addressController.text,
      address2: addressNoteController.text,
      city: selectedCities.value!.name,
      state: selectedProvinces.value!.name,
      country: country.name,
      postalCode: selectedPostcodes.value!.postcode,
      addressTag: "Rumah",
      isPrimary: true,
      refShipperCountryId: country.id,
      refShipperProvinceId: selectedProvinces.value!.id,
      refShipperCityId: selectedCities.value!.id,
      refShipperSuburbId: selectedSuburbs.value!.id,
      refShipperAreaId: selectedAreas.value!.id,
    );

    final response = await postUserAddressUseCase(body);

    safeCallApi<UserAddressResponse>(response,
        onLoad: (status) => isSubmitLoading.value = status,
        onSuccess: (response) {
          commonDialog.showSavedDialog();

          //Todo: ask for province, city, suburb
          cacheManager.saveAddressUser(
            response?.address1 ?? "-",
            response?.address2 ?? "-",
            response?.city ?? "",
            response?.state ?? "",
            response?.country ?? "",
            response?.postalCode ?? "",
            response?.refShipperCountryId ?? 0,
            response?.refShipperProvinceId ?? 0,
            response?.refShipperCityId ?? 0,
            response?.refShipperSuburbId ?? 0,
            response?.refShipperAreaId ?? 0,
          );

          // cache.saveShippingUser(
          //   selectedProvinces.value!,
          //   selectedCities.value!,
          //   selectedSuburbs.value!,
          //   selectedAreas.value!,
          //   selectedPostcodes.value!,
          // );
          Future.delayed(const Duration(seconds: 1), () {
            Get.back(result: "CHANGE");
          });
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isSubmitLoading.value = false;
  }

  void backFormDialog() {
    commonDialog.backFormDialog();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    addressNoteController.dispose();
    phoneController.dispose();
  }
}
