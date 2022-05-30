import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/widget/profile_address.dart';

import '../controller/profile_store_profile_controller.dart';
import '../widget/image_profile_picker.dart';
import '../widget/profile_item.dart';
import '../widget/profile_value_item.dart';

class ProfileStoreProfilePage extends GetView<ProfileStoreProfileController> {
  const ProfileStoreProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profil Toko",
            style: TextStyle(color: black),
          ),
          iconTheme: const IconThemeData(color: black),
          backgroundColor: white,
        ),
        body: SafeArea(
            top: true,
            bottom: true,
            child: Form(
                key: controller.formKey,
                child: Obx(
                  () => Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          children: [
                            const SizedBox(height: 35),
                            Row(
                              children: [
                                controller.imageLoading.value
                                    ? const SizedBox(
                                        child: CircularProgressIndicator(),
                                        height: 70.0,
                                        width: 70.0,
                                      )
                                    : ImageProfilePicker(
                                        imagePath: controller.imageUrl.value,
                                        onChangeClicked: () {
                                          controller.getImage();
                                        }),
                                const SizedBox(width: 25),
                                Text(controller.name.value,
                                    style: title1.copyWith(fontSize: 22)),
                              ],
                            ),
                            const SizedBox(height: 45),
                            ProfileItem(
                              image: "assets/images/profile_web.png",
                              title: controller.web.value,
                              horizontalPadding: 0,
                              onClicked: () {
                                Get.toNamed(RouteName.profileUser);
                              },
                            ),
                            ProfileItem(
                              image: "assets/images/profile_info_black.png",
                              title: controller.info.value,
                              horizontalPadding: 0,
                              onClicked: () {
                                Get.toNamed(RouteName.profileUser);
                              },
                            ),
                            const SizedBox(height: 50),
                            ProfileValueItem(
                              title: "Jenis Usaha",
                              value: controller.business.value,
                            ),
                            ProfileValueItem(
                              title: "Alamat Email",
                              value: controller.email.value,
                            ),
                            ProfileValueItem(
                              title: "Nomor HP",
                              value: controller.phone.value,
                            ),
                            const SizedBox(height: 50),
                            controller.address.value.isNotEmpty
                                ? ProfileAddress(
                                    name: controller.name.value,
                                    phoneNumber: controller.phone.value,
                                    address: controller.address.value,
                                    note: controller.addressNote.value,
                                    suburb: controller.suburb.value,
                                    city: controller.city.value,
                                    province: controller.province.value,
                                    postalCode: controller.postalCode.value,
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ButtonSolidBlue(
                            text: "Ubah",
                            onPressed: () async {
                              var result =
                                  await Get.toNamed(RouteName.profileStoreEdit);
                              if (result != null) {
                                controller.getData();
                              }
                            }),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ))));
  }
}
