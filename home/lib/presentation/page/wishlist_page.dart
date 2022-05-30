import 'package:core/core.dart';
import 'package:core/values/lottie_animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/controller/wishlist_controller.dart';
import 'package:lottie/lottie.dart';

class WishlistPage extends GetView<WishlistController> {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: header.copyWith(color: black),
        ),
        backgroundColor: white,
        iconTheme: const IconThemeData(color: black),
      ),

      // body
      body: SafeArea(
        child: SizedBox(
          height: Get.height * .7,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: .5,
                  child: Lottie.asset(
                    LottieAnimations.emptyState,
                    height: Get.height * .25,
                    width: Get.width,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -15),
                  child: Text(
                    'Belum ada barang \ndi wishlist kamu',
                    textAlign: TextAlign.center,
                    style: bodyText.copyWith(
                      fontWeight: FontWeight.w500,
                      color: darkGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
