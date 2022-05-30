import 'package:cart/data/remote/add_cart_response.dart';
import 'package:cart/data/remote/cart_item_model.dart';
import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/data/remote/delete_cart_response.dart';
import 'package:cart/data/remote/generate_payment_url_response.dart';
import 'package:cart/data/remote/get_coupon_response.dart';
import 'package:cart/data/remote/shipping_rates_reponse.dart';
import 'package:cart/data/remote/wishlist_response_model.dart';
import 'package:core/base/base_data_source.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/constants.dart';

class CartRemoteDataSource extends BaseDataSource {
  CartRemoteDataSource({required this.apiProvider});
  final ApiProvider apiProvider;

  // Get Cart Items
  Future<BaseResult<List<CartItemModelData>>> getCartItem() async {
    return getResult(
        apiProvider.get(URL_CART),
        (response) => response['data']
            .map<CartItemModelData>((e) => CartItemModelData.fromJson(e))
            .toList());
  }

  // Add/Update Cart
  Future<BaseResult<AddCartResponseData>> addCart(int itemId, int qty) async {
    return getResult(
        apiProvider
            .post(URL_CART, {'product_detail_id': itemId, 'quantity': qty}),
        (response) => AddCartResponseData.fromJson(response['data']));
  }

  // Delete Cart
  Future<BaseResult<DeleteCartResponseData>> deleteCart(List<int> items) async {
    return getResult(apiProvider.delete(URL_CART, {'items': items}),
        (response) => DeleteCartResponseData.fromJson(response['data']));
  }

  // Get Coupon Items
  Future<BaseResult<List<GetCouponResponseData>>> getCoupon() async {
    return getResult(
        apiProvider.get(URL_COUPON),
        (response) => response['data']
            .map<GetCouponResponseData>(
                (e) => GetCouponResponseData.fromJson(e))
            .toList());
  }

  // Get Shipping Rates
  Future<BaseResult<ShippingRatesResponseData>> getCourier() async {
    return getResult(apiProvider.get(URL_SHIPPING_RATES),
        (response) => ShippingRatesResponseData.fromJson(response['data']));
  }

  // Update Shipping Rates
  Future<BaseResult<CheckoutResponseData>> updateShipping(
      int shippingOptionId) async {
    return getResult(
        apiProvider.put(URL_UPDATE_SHIPPING_CHECKOUT,
            {'shipping_option_id': shippingOptionId}),
        (response) => CheckoutResponseData.fromJson(response['data']));
  }

  // Update Coupon Checkout
  Future<BaseResult<CheckoutResponseData>> updateCoupon(int couponId) async {
    return getResult(
        apiProvider.put(URL_UPDATE_COUPON_CHECKOUT, {'coupon_id': couponId}),
        (response) => CheckoutResponseData.fromJson(response['data']));
  }

  // Generate Payment URL
  Future<BaseResult<GeneratePaymentUrlResponseData>>
      generatePaymentUrl() async {
    return getResult(
        apiProvider.post(URL_GENERATE_PAYMENT_URL, {}),
        (response) =>
            GeneratePaymentUrlResponseData.fromJson(response['data']));
  }

  // Checkout Item
  Future<BaseResult<CheckoutResponseData>> checkoutItem(
      List<Map> items, int couponId) async {
    if (couponId == 0) {
      return getResult(apiProvider.post(URL_CHECKOUT, {'items': items}),
          (response) => CheckoutResponseData.fromJson(response['data']));
    } else {
      return getResult(
          apiProvider
              .post(URL_CHECKOUT, {'items': items, 'coupon_id': couponId}),
          (response) => CheckoutResponseData.fromJson(response['data']));
    }
  }

  // Get Checkout Data
  Future<BaseResult<CheckoutResponseData>> getCheckoutData() async {
    return getResult(apiProvider.get(URL_CHECKOUT),
        (response) => CheckoutResponseData.fromJson(response['data']));
  }

  // Get Wishlist items
  Future<BaseResult<WishlistResponseData>> getWishlistItems(
      {int page = 1,
      int size = 5,
      String order = "desc",
      String sort = "updated"}) async {
    return getResult(
        apiProvider.get(
            URL_WISHLIST + '?page=$page&size=$size&order=$order&sort=$sort'),
        (response) => WishlistResponseData.fromJson(response['data']));
  }
}
