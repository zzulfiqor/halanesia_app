import 'package:carousel_slider/carousel_controller.dart';
import 'package:core/base/base_response.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/data/request/merchant_status_request.dart';
import 'package:profile/data/request/merchant_workhour_request.dart';
import 'package:profile/data/response/merchant_info_response.dart';
import 'package:profile/data/response/merchant_status_response.dart';
import 'package:profile/data/response/merchant_workhour_response.dart';
import 'package:profile/data/response/merchant_workhour_update_response.dart';
import 'package:profile/usecase/merchant/get_merchant_info_usecase.dart';
import 'package:profile/usecase/merchant/get_merchant_workhour_usecase.dart';
import 'package:profile/usecase/merchant/put_merchant_status_usecase.dart';
import 'package:profile/usecase/merchant/put_merchant_workhour_usecase.dart';

class ProfileStoreController extends BaseController {

  late final GetMerchantInfoUseCase getMerchantInfoUseCase;
  late final PutMerchantStatusUseCase putMerchantStatusUseCase;
  late final GetMerchantWorkhourUseCase getMerchantWorkhourUseCase;
  late final PutMerchantWorkhourUseCase putMerchantWorkhourUseCase;

  var isLoading = false.obs;
  var isStatusLoading = false.obs;
  var isWorkhourLoading = false.obs;

  var currentCarousel = 0.obs;
  var carouselController = CarouselController();

  var isOpen = false.obs;
  var name = "".obs;
  var image = "".obs;

  var monday = MerchantDay().obs;
  var tuesday = MerchantDay().obs;
  var wednesday = MerchantDay().obs;
  var thursday = MerchantDay().obs;
  var friday = MerchantDay().obs;
  var saturday = MerchantDay().obs;
  var sunday = MerchantDay().obs;

  var openTime = "00.00".obs;
  var closeTime = "00.00".obs;
  
  @override
  void onInit() {
    super.onInit();
    getMerchantInfoUseCase = Get.find<GetMerchantInfoUseCase>();
    putMerchantStatusUseCase = Get.find<PutMerchantStatusUseCase>();
    getMerchantWorkhourUseCase = Get.find<GetMerchantWorkhourUseCase>();
    putMerchantWorkhourUseCase = Get.find<PutMerchantWorkhourUseCase>();

    getMerchantInfo();
  }

  void getMerchantInfo() async {
    isLoading.value = true;

    final response =
      await getMerchantInfoUseCase();

    safeCallApi<MerchantInfoResponse>(response, 
      onLoad: (status) => isLoading.value = status,
      onSuccess: (response) {
        name.value = response?.name ?? "";
        isOpen.value = response?.status == 1 ? true : false;
        image.value = response?.profile ?? "";
        cacheManager.saveMerchantInfo(
          response?.name ?? "",
          response?.email ?? "",
          response?.banner ?? "",
          response?.status ?? 1,
          response?.remarkStatus ?? "",
          response?.profile ?? "");
        getMerchantWorkhour();
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    isLoading.value = false;
  }

  void setStatus() async{
    isStatusLoading.value = true;

    var request = MerchantStatusRequest(
      status: isOpen.value ? 2 : 1
    );

    final response =
      await putMerchantStatusUseCase(request);

    safeCallApi<MerchantStatusResponse>(response, 
      onLoad: (status) => isLoading.value = status,
      onSuccess: (response) {
        isOpen.value = !isOpen.value;
        if(isOpen.value){
          commonDialog.showChangeStatusDialog("Toko Dibuka", "assets/images/profile_status_open_white.png");
        }else{
          commonDialog.showChangeStatusDialog("Toko Ditutup", "assets/images/profile_status_close_white.png");
        }
        cacheManager.saveMerchantStatus(
          isOpen.value ? 1 : 2,
          response?.remark ?? "",);
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    isStatusLoading.value = false;
  }

  void getMerchantWorkhour() async {

    final response =
      await getMerchantWorkhourUseCase();

    safeCallApi<MerchantWorkhourResponse>(response, 
      onLoad: (status) => isLoading.value = status,
      onSuccess: (response) {
        if(response!=null){
          monday.value = response.monday!;
          tuesday.value = response.tuesday!;
          wednesday.value = response.wednesday!;
          thursday.value = response.thursday!;
          friday.value = response.friday!;
          saturday.value = response.saturday!;
          sunday.value = response.sunday!;

          if(response.monday!.startHour!=null){
            openTime.value = response.monday!.startHour!;
          }
          if(response.monday!.endHour!=null){
            closeTime.value = response.monday!.endHour!;
          }
        }
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
        setEmptyWorkhour();
      }
    );
  }

  void setEmptyWorkhour() {
    var emptyDay = MerchantDay(open: false, startHour: openTime.value, endHour: closeTime.value);
        monday.value = emptyDay;
        tuesday.value = emptyDay;
        wednesday.value = emptyDay;
        thursday.value = emptyDay;
        friday.value = emptyDay;
        saturday.value = emptyDay;
        sunday.value = emptyDay;
  }

  Future<void> setTime(String time, BuildContext context) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true),
          child: child!);
      }   
    );
    if (result != null) {
      var selected = "${addLeadingZero(result.hour)}:${addLeadingZero(result.minute)}";
      if(time == CLOSE_TIME){
        closeTime.value = selected;
        setCloseTime(); 
      }else if(time == OPEN_TIME){
        openTime.value = selected;
        setOpenTime();
      }
    }
  }

  String addLeadingZero(int value) {
    if (value < 10) {
      return '0$value';
    }
    return value.toString();
  }

  void setOpenTime() {
    monday.value.startHour = openTime.value;
    tuesday.value.startHour = openTime.value;
    wednesday.value.startHour = openTime.value;
    thursday.value.startHour = openTime.value;
    friday.value.startHour = openTime.value;
    saturday.value.startHour = openTime.value;
    sunday.value.startHour = openTime.value;
  }

  void setCloseTime() {
    monday.value.endHour = closeTime.value;
    tuesday.value.endHour = closeTime.value;
    wednesday.value.endHour = closeTime.value;
    thursday.value.endHour = closeTime.value;
    friday.value.endHour = closeTime.value;
    saturday.value.endHour = closeTime.value;
    sunday.value.endHour = closeTime.value;
  }

  void submitWorkhour() async{

    var body = MerchantWorkhourRequest(
      monday: monday.value,
      tuesday: tuesday.value,
      wednesday: wednesday.value,
      thursday: thursday.value,
      friday: friday.value,
      saturday: saturday.value,
      sunday: sunday.value,
    );

    isWorkhourLoading.value = true;

    final response =
      await putMerchantWorkhourUseCase(body);

    safeCallApi<MerchantWorkhourUpdateResponse>(response, 
      onLoad: (status) => isWorkhourLoading.value = status,
      onSuccess: (response) async {
        if(response!=null){
          commonDialog.showSavedDialog();
          await Future.delayed(
            const Duration(seconds: 1),
            () => Get.back()
          );
        }
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    isWorkhourLoading.value = false;
  }
}

