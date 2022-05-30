import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_courier_controller.dart';
import '../widget/profile_address.dart';
import '../widget/profile_courier_item.dart';

class ProfileCourierPage extends GetView<ProfileCourierController> {
  
  const ProfileCourierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Atur Layanan Pengiriman",
          style: TextStyle(color: black
          ),
        ),
        iconTheme: const IconThemeData(
          color: black
        ),
        backgroundColor: white,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Obx(() =>
          controller.isLoading.value 
          ? loadingCircle()
          : ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 35),
              Text("Alamat Pick Up",
              style: header.copyWith(color: basic)
              ),
              const SizedBox(height: 20),
              ProfileAddress(
                tag: 'Alamat Toko',
                name: controller.name.value,
                phoneNumber: controller.phone.value,
                address: controller.address.value,
                note: controller.addressNote.value,
                suburb: controller.suburb.value,
                city: controller.city.value,
                province: controller.province.value,
                postalCode: controller.postalCode.value,
                hasEdit: true,
                onEditClicked: () async {
                  var result = await Get.toNamed(RouteName.profileStoreEdit);
                  if(result != null) {
                    controller.getData();
                  }
               }
              ),
              const SizedBox(height: 50),
              Text("Layanan Pengiriman",
                style: header.copyWith(color: basic)
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: controller.listCourier.value.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      ProfileCourier(
                        courier: controller.listCourier.value[index],
                        onSelect: (i){
                          controller.listCourier.value[index].options![i].isChecked = !controller.listCourier.value[index].options![i].isChecked!;
                          controller.listCourier.refresh();
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
              const SizedBox(height: 60),
              controller.isSubmitLoading.value 
              ? loadingCircle()
              : ButtonSolidBlue(
                text: "Simpan",
                onPressed: (){
                  controller.submit();
                }
              ),
              const SizedBox(height: 20),
            ],
          ),
        )
      )
    );
  }
}