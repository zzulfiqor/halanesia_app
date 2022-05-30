import 'package:cart/controller/payment_webview_controller.dart';
import 'package:get/get.dart';

class PaymentWebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentWebviewController());
  }
}
