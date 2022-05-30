import 'package:core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home/controller/home_controller.dart';

class HomeAppbarController extends BaseController {
  var searchTextEditingController = TextEditingController();
  var searchHasFocus = false.obs;

  // refresh cart
  void refreshCart() {
    Get.find<HomeController>().getCartCount();
  }
}
