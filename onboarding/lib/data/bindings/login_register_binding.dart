import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import 'package:onboarding/presentation/controller/onboarding_controller.dart';

class LoginRegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationManager>(() => AuthenticationManager(),
        fenix: true);
    Get.lazyPut<PostLoginUseCase>(() => PostLoginUseCase(Get.find()),
        fenix: true);
    Get.lazyPut<PostRegisterUseCase>(() => PostRegisterUseCase(Get.find()),
        fenix: true);
    Get.lazyPut<OnBoardingController>(() => OnBoardingController(),
        fenix: true);
  }
}
