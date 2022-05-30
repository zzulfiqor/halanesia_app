import 'package:cart/controller/cart_page_controller.dart';
import 'package:cart/usecases/checkout_cart_usecase.dart';
import 'package:cart/usecases/delete_cart_usecase.dart';
import 'package:cart/usecases/get_cart_items_usecase.dart';
import 'package:cart/usecases/get_coupon_usecase.dart';
import 'package:cart/usecases/get_shipping_rates_usecase.dart';
import 'package:cart/usecases/get_wishlist_items_cart_usecase.dart';
import 'package:cart/usecases/post_generate_payment_url_usecase.dart';
import 'package:cart/usecases/put_checkout_coupon.dart';
import 'package:cart/usecases/put_checkout_shipping.dart';
import 'package:cart/usecases/update_cart_usecase.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetCartItemsUseCase(Get.find()));
    Get.put(GetWishlistItemsCartUseCase(Get.find()));
    Get.put(UpdateCartUseCase(Get.find()));
    Get.put(DeleteCartUseCase(Get.find()));
    Get.put(GetCouponUseCase(Get.find()));
    Get.put(CheckoutCartUseCase(Get.find()));
    Get.put(GetShippingRatesUseCase(Get.find()));
    Get.put(PutCheckoutCouponUsecase(Get.find()));
    Get.put(PutCheckoutShippingUseCase(Get.find()));
    Get.put(PostGeneratePaymentUrlUseCase(Get.find()));

    Get.lazyPut(() => CartPageController(), fenix: true);
  }
}
