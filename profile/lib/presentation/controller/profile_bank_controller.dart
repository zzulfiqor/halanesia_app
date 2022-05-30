import 'package:core/base/base_response.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/data/request/merchant_bank_request.dart';
import 'package:profile/data/response/merchant_bank_data_response.dart';
import 'package:profile/data/response/merchant_bank_response.dart';
import 'package:profile/usecase/merchant/get_merchant_bank_list_usecase.dart';
import 'package:profile/usecase/merchant/post_merchant_bank_usecase.dart';

class ProfileBankController extends BaseController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final GetMerchantBankListUseCase getMerchantBankListUsecase;
  late final PostMerchantBankUseCase postMerchantBankUseCase;

  var numberController = TextEditingController();
  var nameController = TextEditingController();

  var bank = "".obs;
  var number = "".obs;
  var name = "".obs;

  var isLoading = false.obs;

  var isBankLoading = false.obs;
  var selectedBank = Rxn<MerchantBankDataResponse>();
  var listBanks = <MerchantBankDataResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    getMerchantBankListUsecase = Get.find<GetMerchantBankListUseCase>(); 
    postMerchantBankUseCase = Get.find<PostMerchantBankUseCase>();

    if(cacheManager.getBankAccountNameMerchant().isNotEmpty){
      nameController.text = cacheManager.getBankAccountNameMerchant();
    }
    if(cacheManager.getBankAccountNumberMerchant().isNotEmpty){
      numberController.text = cacheManager.getBankAccountNumberMerchant();
    }

    getBankList();
  }

  void getBankList() async {

    isBankLoading.value = true;

    final response =
      await getMerchantBankListUsecase();

    safeCallApi<List<MerchantBankDataResponse>>(response, 
      onLoad: (status) => isLoading.value = status,
      onSuccess: (response) async {
        if(response!=null){
          listBanks.value = response;
          var id = cacheManager.getBankIdMerchant();
          if(id!=0){
            listBanks.value.forEach((bank) {
              if(bank.bankId == id){
                selectedBank.value = bank;
              }
            });
          }
        }
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    isBankLoading.value = false;

  }

  void submit() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    
    print(bank);
    print(number);
    print(name);

    isLoading.value = true;

    var body = MerchantBankRequest(
      bankId: selectedBank.value?.bankId,
      accountName: name.value,
      accountNo: number.value,
      isPrimary: true,
    );

    final response =
      await postMerchantBankUseCase(body);

    safeCallApi<MerchantBankResponse>(response, 
      onLoad: (status) => isLoading.value = status,
      onSuccess: (response) async {
        if(response!=null){
          cacheManager.saveMerchantBank(
            response.accountName,
            response.accountNo,
            response.merchantBankId,
            response.bankId
          );
          commonDialog.showSavedDialog();
          await Future.delayed(const Duration(seconds: 1), (){
            Get.back();
          });
        }
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );

    isLoading.value = false;
  }

  @override
  void onClose() {
    numberController.dispose();
    nameController.dispose();
  }

}