import 'package:core/base/base_response.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/data/request/merchant_edit_request.dart';
import 'package:profile/data/response/merchant_response.dart';
import 'package:profile/data/response/merchant_type_response.dart';
import 'package:profile/usecase/merchant/get_merchant_type_usecase.dart';
import 'package:profile/usecase/merchant/put_merchant_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_area_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_city_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_province_usecase.dart';
import 'package:profile/usecase/shipping/get_shipping_suburb_usecase.dart';

import '../../data/response/shipping_area_response.dart';
import '../../data/response/shipping_city_response.dart';
import '../../data/response/shipping_location_data.dart';
import '../../data/response/shipping_province_response.dart';
import '../../data/response/shipping_suburb_response.dart';

class ProfileStoreEditController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final GetMerchantTypeUseCase getMerchantTypeUseCase;
  late final GetShippingProvinceUseCase getShippingProvinceUseCase;
  late final GetShippingCityUseCase getShippingCityUseCase;
  late final GetShippingSuburbUseCase getShippingSuburbUseCase;
  late final GetShippingAreaUseCase getShippingAreaUseCase;
  late final PutMerchantUseCase putMerchantUseCase;

  var nameController = TextEditingController();
  var webController = TextEditingController();
  var descController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var addressNoteController = TextEditingController();

  var name = "".obs;
  var web = "".obs;
  var desc = "".obs;
  var business = "".obs;
  var typeId = 0.obs;
  var email = "".obs;
  var phone = "".obs;
  var address = "".obs;
  var addressNote = "".obs;

  var isTypeLoading = false.obs;
  var isSubmitLoading = false.obs;
  var isInit = true;

  var listTypes = <MerchantTypeResponse>[].obs;
  var selectedTypes = Rxn<MerchantTypeResponse>();

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
    getMerchantTypeUseCase = Get.find<GetMerchantTypeUseCase>();
    getShippingProvinceUseCase = Get.find<GetShippingProvinceUseCase>();
    getShippingCityUseCase = Get.find<GetShippingCityUseCase>();
    getShippingSuburbUseCase = Get.find<GetShippingSuburbUseCase>();
    getShippingAreaUseCase = Get.find<GetShippingAreaUseCase>();
    putMerchantUseCase = Get.find<PutMerchantUseCase>();

    name.value = cacheManager.getNameMerchant();
    email.value = cacheManager.getEmailMerchant();
    phone.value = cacheManager.getPhoneMerchant();
    typeId.value = cacheManager.getTypeIdMerchant();

    nameController.text = name.value;
    emailController.text = email.value;
    phoneController.text = phone.value;

    if (cacheManager.getWebMerchant().isNotEmpty) {
      web.value = cacheManager.getWebMerchant();
      webController.text = web.value;
    }
    if (cacheManager.getDescMerchant().isNotEmpty) {
      desc.value = cacheManager.getDescMerchant();
      descController.text = desc.value;
    }
    if (cacheManager.getAddressMerchant().isNotEmpty) {
      address.value = cacheManager.getAddressMerchant();
      addressController.text = address.value;
    }
    if (cacheManager.getAddressNoteMerchant().isNotEmpty) {
      addressNote.value = cacheManager.getAddressNoteMerchant();
      addressNoteController.text = addressNote.value;
    }

    selectedProvinces.value = null;
    selectedCities.value = null;
    selectedSuburbs.value = null;
    selectedAreas.value = null;
    selectedPostcodes.value = null;

    getMerchantType();
    getProvinces();
  }

  void getMerchantType() async {
    isTypeLoading.value = true;

    final response = await getMerchantTypeUseCase();

    safeCallApi<List<MerchantTypeResponse>>(response,
        onLoad: (status) => isTypeLoading.value = status,
        onSuccess: (response) {
          listTypes.value = response!;
          for (var t in listTypes.value) {
            if (t.merchantTypeId == typeId.value) {
              selectedTypes.value = t;
            }
          }
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });
    isTypeLoading.value = false;
  }

  void getProvinces() async {
    isProvinceLoading.value = true;
    final response = await getShippingProvinceUseCase();
    var merchantProvinceId = cacheManager.getProvinceIdMerchant();

    safeCallApi<ShippingProvinceResponse>(response,
        onLoad: (status) => isProvinceLoading.value = status,
        onSuccess: (response) {
          listProvinces.value = response!.provinces!;
          if (merchantProvinceId != 0) {
            for (var p in listProvinces) {
              if (p.id == merchantProvinceId) {
                selectedProvinces.value = p;
              }
            }
            getCities(selectedProvinces.value!.id!);
            isInit = false;
          }
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isProvinceLoading.value = false;
  }

  // void setShipping() async{
  //   var provId = cache.getProvinceIdUser();
  //   if(provId != 0){
  //     listProvinces.value.forEach((prov) {
  //       if(prov.id == provId){
  //         selectedProvinces.value = prov;
  //       }
  //     });
  //     final response =
  //       await getShippingCityUseCase(provId);

  //     safeCallApi<ShippingCityResponse>(response,
  //       onLoad: (status) => isCityLoading.value = status,
  //       onSuccess: (response) {
  //         listCities.value = response!.cities!;
  //         var cityId = cache.getCityIdUser();
  //         if(cityId != 0){
  //           listCities.value.forEach((c) {
  //             if(c.id == cityId){
  //               selectedCities.value = c;
  //             }
  //           });
  //           getSuburbs(cityId);
  //           isInit = false;
  //         }

  //       }, onError: (code, message) {
  //         commonDialog.showCommonDialog(message);
  //       }
  //     );
  //   }
  //   isInit = false;
  // }

  void getCities(int id) async {
    isCityLoading.value = true;

    selectedCities.value = null;
    selectedSuburbs.value = null;
    selectedAreas.value = null;
    selectedPostcodes.value = null;

    final response = await getShippingCityUseCase(id);

    var merchantCityId = cacheManager.getCityIdMerchant();

    safeCallApi<ShippingCityResponse>(response,
        onLoad: (status) => isCityLoading.value = status,
        onSuccess: (response) {
          listCities.value = response!.cities!;
          if (merchantCityId != 0) {
            for (var c in listCities) {
              if (c.id == merchantCityId) {
                selectedCities.value = c;
              }
            }
            getSuburbs(selectedCities.value!.id!);
            isInit = false;
          }
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

    final response = await getShippingSuburbUseCase(id);
    var merchantSuburbId = cacheManager.getSuburbIdMerchant();

    safeCallApi<ShippingSuburbResponse>(response,
        onLoad: (status) => isSuburbLoading.value = status,
        onSuccess: (response) {
          listSuburbs.value = response!.suburbs!;
          if (merchantSuburbId != 0) {
            for (var s in listSuburbs) {
              if (s.id == merchantSuburbId) {
                selectedSuburbs.value = s;
              }
            }
            getAreas(selectedSuburbs.value!.id!);
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

    final response = await getShippingAreaUseCase(id);
    var merchantAreaId = cacheManager.getAreaIdMerchant();

    safeCallApi<ShippingAreaResponse>(response,
        onLoad: (status) => isAreaLoading.value = status,
        onSuccess: (response) {
          listAreas.value = response!.areas!;
          if (merchantAreaId != 0) {
            for (var a in listAreas) {
              if (a.id == merchantAreaId) {
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
    }
    listPostcodes.value = <ShippingLocation>[area];
  }

  void submit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    isSubmitLoading.value = true;

    var addressBody = AddressRequest(
        address1: address.value,
        province: selectedProvinces.value!.name,
        provinceId: selectedProvinces.value!.id,
        city: selectedCities.value!.name,
        cityId: selectedCities.value!.id,
        suburb: selectedSuburbs.value!.name,
        suburbId: selectedSuburbs.value!.id,
        area: selectedAreas.value!.name,
        areaId: selectedAreas.value!.id,
        postalCode: selectedPostcodes.value!.postcode,
        note: addressNote.value,
        phone: phone.value);

    var body = MerchantEditRequest(
      type: selectedTypes.value!.merchantTypeId,
      name: name.value,
      email: email.value,
      phone: phone.value,
      url: web.value,
      desc: desc.value,
      address: addressBody,
    );

    final response = await putMerchantUseCase(body);

    safeCallApi<MerchantResponse>(response,
        onLoad: (status) => isSubmitLoading.value = status,
        onSuccess: (response) {
          commonDialog.showSavedDialog();
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
    webController.dispose();
    descController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    addressNoteController.dispose();
  }
}
