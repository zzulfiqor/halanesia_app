import 'package:core/core.dart';
import 'package:get/get.dart';

class ProfileBalanceController extends BaseController {

  var balance = "".obs; 

  @override
  void onInit() {
    super.onInit();

    balance.value = formatCurrencyWithDecimal(1000000);
  }
}