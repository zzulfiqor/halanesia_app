import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/widget/image_rounded_picker.dart';


import '../controller/profile_document_controller.dart';
import '../widget/profile_text_field.dart';

class ProfileDocumentPage extends GetView<ProfileDocumentController> {
  const ProfileDocumentPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dokumen Toko",
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
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 35),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ProfileTextField(
                            title: "Nomor Pokok Wajib Pajak",
                            hint: "Masukkan NPWP",
                            keyboardType: TextInputType.number,
                            controller: controller.npwpController,
                            onSaved: (value){
                              controller.npwp.value = value!;},
                            validator: (value) {
                              return validateEmpty(value!, "Nomor Pokok Wajib Pajak");
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Obx(() => 
                            ImageRoundedPicker(
                              title: "NPWP",
                              size: 60,
                              imagePath: controller.npwpImage.value,
                              onPickClicked: (){
                                controller.getImage(IMAGE_NPWP);
                              },
                              onRemoveClicked: (){
                                controller.removeImage(IMAGE_NPWP);
                              }
                            ),
                          )
                        )
                      ],
                    ),
                    const SizedBox(height: 35),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ProfileTextField(
                            title: "Nomor Induk Berusaha",
                            hint: "Masukkan NIB",
                            keyboardType: TextInputType.number,
                            controller: controller.nibController,
                            onSaved: (value){
                              controller.nib.value = value!;},
                            validator: (value) {
                              return validateEmpty(value!, "Nomor Induk Berusaha");
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Obx(() => 
                            ImageRoundedPicker(
                              title: "Perizinan Berusaha",
                              size: 60,
                              imagePath: controller.nibImage.value,
                              onPickClicked: (){
                                controller.getImage(IMAGE_NIB);
                              },
                              onRemoveClicked: (){
                                controller.removeImage(IMAGE_NIB);
                              }
                            ),
                          )
                        )
                      ],
                    )
                  ]
                )
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonSolidBlue(
                  text: "Simpan",
                  onPressed: (){
                    controller.submit();
                  }
                ),
              ),
              const SizedBox(height: 50),
            ],
          )
        )
      )
    );
  }
}