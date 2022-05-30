import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileProductController extends BaseController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var productDescController = TextEditingController();
  var categoryDescController = TextEditingController();

  var product = "".obs;
  var productDesc = "".obs;
  var category = "".obs;
  var categoryDesc = "".obs;

  void submit() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    print(product);
    print(productDesc);
    print(category);
    print(categoryDesc);

    // commonDialog.showSavedDialog();
  }

  @override
  void onClose() {
    productDescController.dispose();
    categoryDescController.dispose();
  }
}