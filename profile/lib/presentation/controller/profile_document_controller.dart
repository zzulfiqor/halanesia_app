import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/profile_item.dart';

class ProfileDocumentController extends BaseController {
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var npwpController = TextEditingController();
  var nibController = TextEditingController();
  
  var npwp = "".obs;
  var nib = "".obs;

  final _picker = ImagePicker();

  var npwpImage = "".obs;
  var nibImage = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  void submit() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    
    print(npwp);
    print(nib);

    // commonDialog.showSavedDialog();
  }

  void getImage(String type) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        backgroundColor: white,
        child: Container(
          height: 200,
          width: 350,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Foto Profil",
                  style: header.copyWith(color: basic)
                )
              ),
              const SizedBox(
                height: 30
              ),
              ProfileItem(
                title: "Ambil Foto",
                image: "assets/images/camera.png",
                onClicked: (){
                  getImageCamera(type);
                  Get.back();
                },
              ),
              const SizedBox(
                height: 15
              ),
              ProfileItem(
                title: "Galeri Foto",
                image: "assets/images/gallery.png",
                onClicked: (){
                  getImageGallery(type);
                  Get.back();
                  },
                ),
              ]
            ),
          ),
        )
    );
  }

  Future<void> getImageGallery(String type) async {
    // final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    // if (pickedFile != null) {
    //   switch (type) {
    //     case IMAGE_NPWP:
    //       npwpImage.value = pickedFile.path;
    //       print(npwpImage);
    //       break; 
    //     case IMAGE_NIB:
    //       nibImage.value = pickedFile.path;
    //       print(nibImage);
    //       break; 
    //   }
    // } else {
    //   print('No image selected.');
    // }
  }

  Future<void> getImageCamera(String type) async {
    // final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    // if (pickedFile != null) {
    //   switch (type) {
    //     case IMAGE_NPWP:
    //       npwpImage.value = pickedFile.path;
    //       print(npwpImage);
    //       break; 
    //     case IMAGE_NIB:
    //       nibImage.value = pickedFile.path;
    //       print(nibImage);
    //       break; 
    //   }
    // } else {
    //   print('Tidak ada gambar');
    // }
  }

  void removeImage(String type){
    switch (type) {
        case IMAGE_NPWP:
          npwpImage.value = "";
          break; 
        case IMAGE_NIB:
          nibImage.value = "";
          break; 
      }
  }

}