import 'package:core/core.dart';
import 'package:get/get.dart';

class PaymentWebviewController extends BaseController {
  final _url = ''.obs;
  String get url => _url.value;
  set url(String value) => _url.value = value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    url = Get.arguments[0];
    super.onInit();
  }

  // onBackPressed
  Future<bool> onBackPressed() async {
    // if still loading
    if (isLoading) {
      return false;
    }

    // if from beli langsung
    if (Get.arguments[1] == RouteName.directBuy) {
      Get.offAllNamed(RouteName.home);
      return false;
    }

    Get.back();
    return true;
  }
}
