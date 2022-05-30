import 'package:core/base/base_response.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/data/response/merchant_info_detail_response.dart';
import 'package:profile/usecase/merchant/get_merchant_info_detail_usecase.dart';
import 'package:profile/usecase/merchant/post_merchant_image_usecase.dart';

import '../../data/response/merchant_response.dart';
import '../widget/profile_item.dart';

class ProfileStoreProfileController extends BaseController {
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final PostMerchantImageUseCase postMerchantImageUseCase;
  late final GetMerchantInfoDetailUseCase getmerchantInfoDetailUseCase;

  var imagePath = "";
  var imageLoading = false.obs;
  final _picker = ImagePicker();

  var isLoading = false.obs;
  
  var name = "".obs;
  var web = "".obs;
  var info = "".obs;
  var business = "".obs;
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
    postMerchantImageUseCase = Get.find<PostMerchantImageUseCase>();
    getmerchantInfoDetailUseCase = Get.find<GetMerchantInfoDetailUseCase>();

    getData();
  }

  void getData(){
    imageUrl.value = cacheManager.getImageMerchant();
    name.value = cacheManager.getNameMerchant();
    web.value = cacheManager.getWebMerchant();
    info.value = cacheManager.getDescMerchant();
    business.value = cacheManager.getTypeNameMerchant();
    email.value = cacheManager.getEmailMerchant();
    phone.value = cacheManager.getPhoneMerchant();
    address.value = cacheManager.getAddressMerchant();
    addressNote.value = cacheManager.getAddressNoteMerchant();
    suburb.value = cacheManager.getAddressSuburbMerchant();
    city.value = cacheManager.getAddressCityMerchant();
    province.value = cacheManager.getAddressProvMerchant();
    postalCode.value = cacheManager.getAddressPostalMerchant();

    getMerchantDetail();
  }

  void getMerchantDetail() async {
    isLoading.value = true;

    final response =
      await getmerchantInfoDetailUseCase();

    safeCallApi<MerchantInfoDetailResponse>(response, 
      onLoad: (status) => isLoading.value = status,
      onSuccess: (response) {
        if(response!=null){
          name.value = response.name ?? "-";
          business.value = response.type?.typeName ?? "-";
          phone.value = response.phone ?? "-";
          email.value = response.email ?? "-";
          web.value = response.url ?? "-";
          info.value = response.desc ?? "-";
          imageUrl.value = response.profilePicture ?? "";

          cacheManager.saveMerchantDetail(
            name.value,
            response.type?.typeId ?? 0,
            response.type?.typeName ?? "",
            response.phone ?? "",
            response.email ?? "",
            response.desc ?? "",
            response.isPhysical ?? false,
            response.profilePicture ?? "",
            response.url ?? "");
          
          if(response.address!=null){
            cacheManager.saveMerchantAddress(response.address!);
          }
        }
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    isLoading.value = false;
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
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath = pickedFile.path;
      uploadImage(imagePath);
      print(imagePath);
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

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
      await postMerchantImageUseCase(image);

    safeCallApi<MerchantResponse>(response, 
      onLoad: (status) => imageLoading.value = status,
      onSuccess: (response) {
        if(response!=null) {
          cacheManager.saveImageMerchant(response.url!);
          imageUrl.value = response.url!;
        }
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    imageLoading.value = false;
  }
}