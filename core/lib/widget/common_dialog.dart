import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core.dart';

class CommonDialog {
 

  void showCommonDialog(String message, {Function? onPressed}) {
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
            if (onPressed != null) {
              onPressed();
            } else {
              Get.back();
            }
          },
        ),
      ),
    );
    
  }

  void showSavedDialog() {
    showChangeStatusDialog(
        "Data Disimpan", "assets/images/profile_check_white.png");
  }

  Future<void> showChangeStatusDialog(String title, String image,
      {String subTitle = "", int duration = 1}) async {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      backgroundColor: transparentDarkGrey,
      child: Container(
        width: 260,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: loadImageAssetSquare(image, 40.0),
              ),
              const SizedBox(height: 20),
              Center(
                  child: Text(title,
                      style: title1.copyWith(color: white, fontSize: 22))),
              subTitle.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                          child: Text(subTitle,
                              style: bodyText.copyWith(color: white))))
                  : Container(),
            ]),
      ),
    ));

    await Future.delayed(Duration(seconds: duration), () => Get.back());
  }

  void backFormDialog() {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      backgroundColor: white,
      child: Container(
        width: 350,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Buang Perubahan?", style: header.copyWith(color: basic)),
              const SizedBox(height: 25),
              SizedBox(
                width: 190,
                child: ButtonOutlineBlueMedium(
                    text: "Buang",
                    onPressed: () {
                      Get.back();
                      Get.back(result: "CHANGE");
                    }),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: 190,
                child: ButtonSolidBlueMedium(
                    text: "Kembali",
                    onPressed: () {
                      Get.back();
                    }),
              ),
            ]),
      ),
    ));
  }

  void showCourierInfo(String courier, String desc) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      backgroundColor: white,
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(courier, style: header.copyWith(color: basic)),
              const SizedBox(height: 10),
              const Divider(color: neutralGrey),
              const SizedBox(height: 10),
              Text(desc, style: subTitle3.copyWith(color: basic)),
            ]),
      ),
    ));
  }

  void showDetailInfo(String title, {required Widget content}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      backgroundColor: white,
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(title, style: header.copyWith(color: basic)),

              // Divider
              const Divider(color: neutralGrey, thickness: 1),

              // Content
              const SizedBox(height: 10),
              content,
            ]),
      ),
    ));
  }

  void showLoadingDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        backgroundColor: white,
        child: Container(
          width: 75,
          height: 100,
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                loadingSmallCircle(),
              ]),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showConfirmationDialog(
      {required String title,
      required String positiveTitle,
      required String negativeTitle,
      required VoidCallback positiveClick}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      backgroundColor: white,
      child: Container(
        width: 350,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: header.copyWith(color: basic)),
              const SizedBox(height: 25),
              SizedBox(
                  width: 190,
                  child: ButtonOutlineBlueMedium(
                    text: positiveTitle,
                    onPressed: positiveClick,
                  )),
              const SizedBox(height: 25),
              SizedBox(
                width: 190,
                child: ButtonSolidBlueMedium(
                    text: negativeTitle,
                    onPressed: () {
                      Get.back();
                    }),
              ),
            ]),
      ),
    ));
  }
}
