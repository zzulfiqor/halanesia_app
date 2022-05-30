import 'package:cart/data/remote/get_coupon_response.dart';
import 'package:core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PromoBottomSheetController extends BaseController {
  final _promoTextInputController = TextEditingController().obs;
  TextEditingController get promoTextInputController =>
      _promoTextInputController.value;

  final _selectedPromo = GetCouponResponseData(id: "0").obs;
  GetCouponResponseData get selectedPromo => _selectedPromo.value;
  set selectedPromo(GetCouponResponseData value) => _selectedPromo.value = value;
}
