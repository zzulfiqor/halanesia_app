import 'package:core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/controller/profile_controller.dart';

import '../widget/profile_item.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        body: RefreshIndicator(
          onRefresh: () async => controller.getProfile(),
          child: SafeArea(
              top: true,
              bottom: true,
              child: Column(
                children: [
                  Container(
                      color: secondary,
                      child: Column(
                        children: [
                          const SizedBox(height: 55),
                          Obx(
                            () => Row(
                              children: [
                                const SizedBox(width: 30),
                                loadImageProfile(controller.image.value, 50),
                                const SizedBox(width: 20),
                                Text(controller.name.value,
                                    style: title1.copyWith(color: white)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      )),
                  Obx(() => controller.isLoading.value
                      ? Expanded(child: loadingCircle())
                      : Expanded(
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification:
                                (OverscrollIndicatorNotification overscroll) {
                              overscroll.disallowIndicator();
                              return false;
                            },
                            child: ListView(
                              children: [
                                // Profil If Haven't Store
                                !controller.hasMerchant.value
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 25),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "Mau mulai berbisnis? ",
                                                  style: subTitle2),
                                              TextSpan(
                                                  text: "Buka toko sekarang!",
                                                  style: subTitle2.copyWith(
                                                      color: secondary),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          var result = await Get
                                                              .toNamed(RouteName
                                                                  .profileStoreRegister);
                                                          if (result != null) {
                                                            controller
                                                                .getProfile();
                                                          }
                                                        }),
                                            ]),
                                          ),
                                        ),
                                      )
                                    : Container(height: 40),

                                // Profil If Have Store
                                controller.hasMerchant.value
                                    ? ProfileItem(
                                        image:
                                            "assets/images/profile_store.png",
                                        title: "Kelola Toko",
                                        onClicked: () {
                                          Get.toNamed(RouteName.profileStore);
                                        },
                                      )
                                    : Container(),

                                // Profil Pengguna
                                ProfileItem(
                                  image: "assets/images/profile_user.png",
                                  title: "Profil Pengguna",
                                  onClicked: () async {
                                    var result = await Get.toNamed(
                                        RouteName.profileUser);
                                    if (result != null) {
                                      controller.getData();
                                    }
                                  },
                                ),

                                // Saldo
                                ProfileItem(
                                  image: "assets/images/profile_balance.png",
                                  title: "Saldo Saya",
                                  onClicked: () async {
                                    var result = await Get.toNamed(
                                        RouteName.profileBalance);
                                    if (result != null) {
                                      controller.getData();
                                    }
                                  },
                                ),

                                // Bantuan
                                ProfileItem(
                                  image: "assets/images/profile_help.png",
                                  title: "Bantuan",
                                  onClicked: () {},
                                ),

                                // Tentang Kami
                                ProfileItem(
                                  image: "assets/images/profile_info.png",
                                  title: "Tentang Kami",
                                  onClicked: () {},
                                ),
                              ],
                            ),
                          ),
                        )),

                  // Logout Button & App Version
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Logout Button
                        SizedBox(
                          width: Get.width,
                          child: ButtonOutlineBlueMedium(
                            text: "Logout",
                            onPressed: () {
                              // make dialog logout
                              Get.defaultDialog(
                                title: "Logout",
                                content: const Text(
                                    "Apakah anda yakin ingin keluar?"),
                                confirm: OutlinedButton(
                                  onPressed: () {
                                    controller.logout();
                                    Get.back();
                                  },
                                  child: const Text("Ya"),
                                ),
                                cancel: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("Tidak"),
                                ),
                              );

                              // controller.logout();
                            },
                          ),
                        ),

                        // App Version
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                            "${controller.packageInfo.appName} v${controller.packageInfo.version}",
                            style: subTitle2.copyWith(color: darkGrey)),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
