import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWithdrawController extends BaseController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var withdrawController = TextEditingController();

  var balance = "".obs;
  var withdraw = "".obs;
  var bankName = "".obs;
  var name = "".obs;
  var bankNumber = "".obs;

  @override
  void onInit() {
    super.onInit();

    balance.value = formatCurrencyWithDecimal(1000000);
    bankName.value = "Nama Bank";
    name.value = "Nama User";
    bankNumber.value = "875754764674";
  }  
  
  Future<void> withdrawBalance() async{
    commonDialog.showChangeStatusDialog(
      "Saldo Berhasil Ditarik",
      "assets/images/profile_check_white.png",
      subTitle: "Dana akan diterima di akun\nbank anda dalam 2x24 jam",
      duration: 3
    );
    await Future.delayed(const Duration(seconds: 3), (){
      Get.back();
    });
  }
}