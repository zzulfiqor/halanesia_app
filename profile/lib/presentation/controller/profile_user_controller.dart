import 'package:core/base/base_response.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/usecase/user/put_user_image_profile_usecase.dart';

import '../../data/response/user_info_response.dart';
import '../widget/profile_item.dart';

class ProfileUserController extends BaseController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final PutUserImageProfileUseCase putUserImageProfileUseCase;

  var imagePath = "";
  var imageLoading = false.obs;
  final picker = ImagePicker();
  
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var imageUrl = "".obs;
  
  var address = "".obs;
  var addressNote = "".obs;
  var suburb = "".obs;
  var city = "".obs;
  var province = "".obs;
  var postalCode = "".obs;

  @override
  void onInit() {
    super.onInit();
    putUserImageProfileUseCase = Get.find<PutUserImageProfileUseCase>();

    getData();
  }

  void getData() {
    imageUrl.value = cacheManager.getImageUser(); 
    name.value = cacheManager.getNameUser();
    email.value = cacheManager.getEmailUser();
    phone.value = cacheManager.getPhoneUser();
    address.value = cacheManager.getAddressUser();
    addressNote.value = cacheManager.getAddressNoteUser();
    suburb.value = cacheManager.getSuburbUser();
    city.value = cacheManager.getCityUser();
    province.value = cacheManager.getProvinceUser();
    postalCode.value = cacheManager.getPostcodeUser();
  }


  void getImage() {
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
                  getImageCamera();
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
                  getImageGallery();
                  Get.back();
                  },
                ),
              ]
            ),
          ),
        )
    );
  }

  Future<void> getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath = pickedFile.path;
      uploadImage(imagePath);
      print(imagePath);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imagePath = pickedFile.path;
      uploadImage(imagePath);
      print(imagePath);
    } else {
      print('Tidak ada gambar');
    }
  }

  Future<void> uploadImage(String image) async {
    imageLoading.value = true;

    final response =
      await putUserImageProfileUseCase(image);

    safeCallApi<UserInfoResponse>(response, 
      onLoad: (status) => imageLoading.value = status,
      onSuccess: (response) {
        imageUrl.value = response?.imgPath ?? "";
        cacheManager.saveImageUserProfile(imageUrl.value);
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    imageLoading.value = false;
  }
}