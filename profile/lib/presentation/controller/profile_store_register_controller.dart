import 'package:core/base/base_response.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/usecase/merchant/get_merchant_type_usecase.dart';
import 'package:profile/usecase/merchant/post_merchant_register_usecase.dart';

import '../../data/request/merchant_profile_request.dart';
import '../../data/response/merchant_response.dart';
import '../../data/response/merchant_type_response.dart';

class ProfileStoreRegisterController extends BaseController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  late final GetMerchantTypeUseCase getMerchantTypeUseCase;
  late final PostMerchantRegisterUseCase postMerchantRegister;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var typeId = 0.obs;

  var isTypeLoading = false.obs;
  var isSubmitLoading = false.obs;
  var listTypes = <MerchantTypeResponse>[].obs;
  var selectedTypes = Rxn<MerchantTypeResponse>();

  @override
  void onInit() {
    super.onInit();
    getMerchantTypeUseCase = Get.find<GetMerchantTypeUseCase>();
    postMerchantRegister = Get.find<PostMerchantRegisterUseCase>();

    getMerchantType();
  }

  void getMerchantType() async {
    isTypeLoading.value = true;

    final response =
      await getMerchantTypeUseCase();

    safeCallApi<List<MerchantTypeResponse>>(response, 
      onLoad: (status) => isTypeLoading.value = status,
      onSuccess: (response) {
        listTypes.value = response!;
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );
    isTypeLoading.value = false;
  }

  void submit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    isSubmitLoading.value = true;

    print(name);
    print(email);
    print(phone);
    print(typeId.toString());

    var body = MerchantProfileRequest(
      type: typeId.value,
      name: name.value,
      email: email.value,
      phone: phone.value,
    );

    final response =
      await postMerchantRegister(body);

    safeCallApi<MerchantResponse>(response, 
      onLoad: (status) => isSubmitLoading.value = status,
      onSuccess: (response) {
        commonDialog.showSavedDialog();
        cacheManager.saveMerchantId(response!.merchantId!);
        
        Future.delayed(const Duration(seconds: 1), () {
          Get.back(result: "CHANGE");
        });
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    isSubmitLoading.value = false;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }
}