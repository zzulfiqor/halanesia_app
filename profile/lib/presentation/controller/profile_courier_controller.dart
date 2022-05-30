import 'package:core/base/base_response.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:profile/data/request/shipping_option_request.dart';
import 'package:profile/data/response/shipping_option_response.dart';
import 'package:profile/data/response/shipping_option_update_response.dart';
import 'package:profile/usecase/shipping/get_shipping_option_usecase.dart';
import 'package:profile/usecase/shipping/put_shipping_option_usecase.dart';

class ProfileCourierController extends BaseController {

  late final GetShippingOptionUseCase getShippingOptionUseCase;
  late final PutShippingOptionUseCase putShippingOptionUseCase;

  var isLoading = false.obs;
  var isSubmitLoading = false.obs;

  var name = "".obs;
  var phone = "".obs;
  var address = "".obs;
  var addressNote = "".obs;  
  var suburb = "".obs;
  var city = "".obs;
  var province = "".obs;
  var postalCode = "".obs;

  var listCourier = <ShippingOptionResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    getShippingOptionUseCase = Get.find<GetShippingOptionUseCase>(); 
    putShippingOptionUseCase = Get.find<PutShippingOptionUseCase>();

    getData();
    getListShipping();

  }

  void getData(){
    name.value = cacheManager.getNameMerchant();
    phone.value = cacheManager.getPhoneMerchant();
    address.value = cacheManager.getAddressMerchant();
    addressNote.value = cacheManager.getAddressNoteMerchant();
    suburb.value = cacheManager.getAddressSuburbMerchant();
    city.value = cacheManager.getAddressCityMerchant();
    province.value = cacheManager.getAddressProvMerchant();
    postalCode.value = cacheManager.getAddressPostalMerchant();
  }

  void getListShipping() async{
    
    isLoading.value = true;

    final response =
      await getShippingOptionUseCase();

    safeCallApi<List<ShippingOptionResponse>>(response, 
      onLoad: (status) => isLoading.value = status,
      onSuccess: (response) async {
        if(response!=null){
          var data = response;
          data.removeWhere((item) => item.id == -1);
          listCourier.value = data;
        }
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    isLoading.value = false;
  }

  void submit() async {
    isSubmitLoading.value = true;

    var option = <int>[];
    for (var courier in listCourier.value) {
      for (var op in courier.options!) {
        if(op.isChecked!){
          option.add(op.id!);
        }
      }
    }

    var body = ShippingOptionRequest(
      options: option
    );

    option.forEach((element) {
      print(element);
    });

    final response =
      await putShippingOptionUseCase(body);

    safeCallApi<ShippingOptionUpdateResponse>(response, 
      onLoad: (status) => isLoading.value = status,
      onSuccess: (response) async {
        if(response!=null){
          commonDialog.showSavedDialog();
          await Future.delayed(const Duration(seconds: 1), (){
            Get.back(result: "CHANGE");
          });
        }
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    isSubmitLoading.value = false;
  }


}