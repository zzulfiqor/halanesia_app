import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class BaseController extends GetxController {
  late final CacheManager cacheManager;
  late final CommonDialog commonDialog;

  @override
  onInit() {
    super.onInit();
    cacheManager = Get.find();
    commonDialog = Get.find();
  }

  void showCommonDialog(String message) {
    Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 8),
      contentPadding: const EdgeInsets.all(16),
      title: "Oppss",
      middleText: message,
      textConfirm: 'OK',
      confirmTextColor: Colors.white,
      confirm: SizedBox(
        width: 150,
        child: ButtonOutlineBlue(
          text: 'OK',
          onPressed: () async {
            Get.back();
          },
        ),
      ),
    );
  }
}
