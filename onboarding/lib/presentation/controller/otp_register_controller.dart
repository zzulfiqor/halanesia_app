import 'package:core/base/base_response.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import 'package:core/entity/otp_request.dart';

class OtpRegisterController extends BaseController {
  late final PostOtpVerificationUseCase postOtpVerificationUseCase;

  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    postOtpVerificationUseCase = Get.find();
  }

  Future<void>
  verifyOtp(String email, String otp) async {
    final response =
        await postOtpVerificationUseCase(OtpRequest(email: email, otp: otp));
    safeCallApi(response, onSuccess: (response) {
      Get.offNamed(RouteName.home);
    }, onError: (code, message) {
      commonDialog.showCommonDialog(message);
    });
  }
}
