import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_user_controller.dart';
import '../widget/image_profile_picker.dart';
import '../widget/profile_address.dart';
import '../widget/profile_value_item.dart';

class ProfileUserPage extends GetView<ProfileUserController> {
  
  const ProfileUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Get.back(result: "CHANGE");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profil Pengguna",
            style: TextStyle(color: black
            ),
          ),
          iconTheme: const IconThemeData(
            color: black
          ),
          backgroundColor: white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back(result: "CHANGE");
            },
          ),
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Expanded(
                  child: Obx(()=>
                    ListView(
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
                              onChangeClicked: (){
                                controller.getImage();
                              }
                            ),
                            const SizedBox(width: 25),
                            Text(
                              controller.name.value,
                              style: title1.copyWith(fontSize: 22)
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        ProfileValueItem(
                          title: "Alamat Email",
                          value: controller.email.value,
                        ),
                        ProfileValueItem(
                          title: "Nomor HP",
                          value: controller.phone.value,
                        ),
                        const SizedBox(height: 50),
                        ProfileAddress(
                          name: controller.name.value,
                          phoneNumber: controller.phone.value,
                          address: controller.address.value,
                          note: controller.addressNote.value,
                          suburb: controller.suburb.value,
                          city: controller.city.value,
                          province: controller.province.value,
                          postalCode: controller.postalCode.value,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonSolidBlue(
                    text: "Ubah",
                    onPressed: () async{
                      var result = await Get.toNamed(RouteName.profileUserEdit);
                      if(result!=null) {
                        print("hasResult");
                        controller.getData();
                      }
                    }
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          )
        )
      ),
    );
  }
}