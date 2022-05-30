import 'dart:developer';

import 'package:cart/cart.dart';
import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/data/remote/generate_payment_url_response.dart';
import 'package:cart/data/remote/get_coupon_response.dart';
import 'package:cart/data/remote/shipping_rates_reponse.dart';
import 'package:cart/usecases/get_checkout_data_usecase.dart';
import 'package:cart/usecases/get_coupon_usecase.dart';
import 'package:cart/usecases/get_shipping_rates_usecase.dart';
import 'package:cart/usecases/post_generate_payment_url_usecase.dart';
import 'package:cart/usecases/put_checkout_coupon.dart';
import 'package:cart/usecases/put_checkout_shipping.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:get/get.dart';

class DirectBuyPageController extends BaseController {
  late final GetCouponUseCase getCouponUseCase;
  late final GetShippingRatesUseCase getShippingRatesUseCase;
  late final PutCheckoutCouponUsecase putCheckoutCouponUsecase;
  late final PutCheckoutShippingUseCase putCheckoutShippingUseCase;
  late final PostGeneratePaymentUrlUseCase postGeneratePaymentUrlUseCase;
  late final GetCheckoutDataUseCase getCheckoutDataUseCase;

  final _selectedCourier =
      ShippingRatesResponseDataPricingsLogistics(id: null).obs;
  ShippingRatesResponseDataPricingsLogistics get selectedCourier =>
      _selectedCourier.value;
  set selectedCourier(ShippingRatesResponseDataPricingsLogistics value) =>
      _selectedCourier.value = value;

  final _selectedPromo = PromoModel().obs;
  PromoModel get selectedPromo => _selectedPromo.value;
  set selectedPromo(PromoModel value) => _selectedPromo.value = value;

  final _courierList = <ShippingRatesResponseDataPricingsLogistics>[].obs;
  List<ShippingRatesResponseDataPricingsLogistics> get courierList =>
      _courierList;
  set courierList(List<ShippingRatesResponseDataPricingsLogistics> value) =>
      _courierList.value = value;

  final _isCourierLoading = true.obs;
  bool get isCourierLoading => _isCourierLoading.value;
  set isCourierLoading(bool value) => _isCourierLoading.value = value;

  final _isGeneratePaymentLoading = false.obs;
  bool get isGeneratePaymentLoading => _isGeneratePaymentLoading.value;
  set isGeneratePaymentLoading(bool value) =>
      _isGeneratePaymentLoading.value = value;

  final _checkoutData = CheckoutResponseData().obs;
  CheckoutResponseData get checkoutData => _checkoutData.value;
  set checkoutData(CheckoutResponseData value) => _checkoutData.value = value;

  final _selectedCoupon = GetCouponResponseData().obs;
  GetCouponResponseData get selectedCoupon => _selectedCoupon.value;
  set selectedCoupon(GetCouponResponseData value) =>
      _selectedCoupon.value = value;

  final _couponItems = <GetCouponResponseData>[].obs;
  List<GetCouponResponseData> get couponItems => _couponItems;
  set couponItems(List<GetCouponResponseData> value) =>
      _couponItems.value = value;

  @override
  void onInit() {
    super.onInit();
    getCheckoutDataUseCase = Get.find();
    getCouponUseCase = Get.find();
    getShippingRatesUseCase = Get.find();
    putCheckoutCouponUsecase = Get.find();
    putCheckoutShippingUseCase = Get.find();
    postGeneratePaymentUrlUseCase = Get.find();

    getCheckoutData();
    getShipping();
    getCoupon();
  }

  // Get Checkout Data
  Future<void> getCheckoutData() async {
    final response = await getCheckoutDataUseCase(NoParams());
    safeCallApi<CheckoutResponseData>(response, onSuccess: (response) {
      checkoutData = response ?? CheckoutResponseData();
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  // Get Shipping Rates
  Future<void> getShipping() async {
    final response = await getShippingRatesUseCase(NoParams());
    safeCallApi<ShippingRatesResponseData>(response, onSuccess: (response) {
      courierList = [];
      response?.pricings?.forEach((element) {
        element?.logistics?.forEach((e) {
          courierList.add(e ?? ShippingRatesResponseDataPricingsLogistics());
        });
      });
      log(courierList.length.toString());
      isCourierLoading = false;
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  // Get Coupon Items
  Future<void> getCoupon() async {
    isCourierLoading = true;
    final response = await getCouponUseCase(NoParams());
    safeCallApi<List<GetCouponResponseData>>(response, onSuccess: (response) {
      couponItems = response ?? [];
      isCourierLoading = false;
    }, onError: (code, message) {
      isCourierLoading = false;
      showCommonDialog(message);
    });
  }

  // Update Shipping
  Future<void> updateShipping(int id) async {
    final response = await putCheckoutShippingUseCase(id);
    safeCallApi<CheckoutResponseData>(response, onSuccess: (response) {
      checkoutData = response ?? CheckoutResponseData();
      Get.back();
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  // Update Coupon
  Future<void> updateCoupon(int id) async {
    final response = await putCheckoutCouponUsecase(id);
    safeCallApi<CheckoutResponseData>(response, onSuccess: (response) {
      checkoutData = response ?? CheckoutResponseData();
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  // Generate Payment Url
  Future<void> generatePaymentUrl() async {
    isGeneratePaymentLoading = true;
    final response = await postGeneratePaymentUrlUseCase(NoParams());
    safeCallApi<GeneratePaymentUrlResponseData>(response,
        onSuccess: (response) {
      isGeneratePaymentLoading = false;
      Get.offNamed(RouteName.paymentWebView, arguments: [response?.payment?.url, RouteName.directBuy]);
    }, onError: (code, message) {
      isGeneratePaymentLoading = false;
      showCommonDialog(message);
    });
  }
}
