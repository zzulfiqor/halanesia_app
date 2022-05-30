import 'package:cart/cart.dart';
import 'package:cart/data/remote/shipping_rates_reponse.dart';
import 'package:core/base/base_controller.dart';
import 'package:get/get.dart';

class AvailableShippingBottomSheetController extends BaseController{
  final _selectedCourier = ShippingRatesResponseDataPricingsLogistics().obs;
  ShippingRatesResponseDataPricingsLogistics get selectedCourier => _selectedCourier.value;
  set selectedCourier(ShippingRatesResponseDataPricingsLogistics value) =>
      _selectedCourier.value = value;
}