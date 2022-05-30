import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import '../../presentation/controller/otp_register_controller.dart';

class OTPRegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostOtpVerificationUseCase>(
        () => PostOtpVerificationUseCase(Get.find()),
        fenix: true);
    Get.lazyPut<OtpRegisterController>(() => OtpRegisterController(),
        fenix: true);
  }
}
