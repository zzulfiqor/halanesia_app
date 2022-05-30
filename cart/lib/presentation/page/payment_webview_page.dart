import 'package:cart/controller/payment_webview_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebviewPage extends GetView<PaymentWebviewController> {
  const PaymentWebviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await controller.onBackPressed();
        return false;
      },
      child: Obx(() => controller.isLoading
          ? Scaffold(
              body: Center(
                child: loadingCircle(),
              ),
            )
          : Scaffold(
              body: SafeArea(
                child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: WebView(
                    // On Progress
                    onProgress: (progress) {
                      if (progress == 100) {
                        controller.isLoading = false;
                      }
                    },

                    // On Complete
                    onPageFinished: (val) {
                      if (val.contains('payment/page')) {
                        // Get.back();
                      }
                    },

                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: controller.url,
                  ),
                ),
              ),
            )),
    );
  }
}
