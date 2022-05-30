import 'package:core/core.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:core/entity/login_request.dart';
import '../../onboarding.dart';
import 'package:core/base/base_response.dart';
import 'package:core/entity/login_response.dart';
import 'package:flutter/material.dart';
import 'package:core/entity/register_request.dart';

class OnBoardingController extends BaseController {
  late final PostLoginUseCase postLoginUseCase;
  late final PostRegisterUseCase postRegisterUseCase;

  var isWaiting = true.obs;
  var token = "";

  @override
  Future<void> onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 1), () => checkUserStatus());
  }

  void checkUserStatus() {
    if (token.isNotEmpty) {
      Get.offNamed(RouteName.home);
    } else {
      isWaiting.value = false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    token = cacheManager.getToken();
    postLoginUseCase = Get.find();
    postRegisterUseCase = Get.find();
  }

  var loading = true.obs;
  var formType = FormType.login.obs;

  void changeFormType() {
    formType.value == FormType.login
        ? formType.value = FormType.register
        : formType.value = FormType.login;
  }

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    final response =
        await postLoginUseCase(LoginRequest(email: email, password: password));

    safeCallApi<LoginResponse>(response, onSuccess: (response) async {
      cacheManager
          .saveToken(response?.accessToken, response?.refreshToken,
              response?.tokenType)
          .then((value) => Get.offNamed(RouteName.home));
    }, onError: (code, message) {
      commonDialog.showCommonDialog(message);
    });
  }

  Future<void> registerUser(
      String email, String fullName, String password) async {
    final response = await postRegisterUseCase(
        RegisterRequest(email: email, fullName: fullName, password: password));

    safeCallApi(response, onSuccess: (response) {
      Get.toNamed(RouteName.otp, arguments: email);
    }, onError: (code, message) {
      commonDialog.showCommonDialog(message);
    });
  }
}
