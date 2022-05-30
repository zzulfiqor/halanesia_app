import 'package:cart/data/remote/add_cart_response.dart';
import 'package:cart/data/remote/cart_item_model.dart';
import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/data/remote/delete_cart_response.dart';
import 'package:cart/data/remote/generate_payment_url_response.dart';
import 'package:cart/data/remote/get_coupon_response.dart';
import 'package:cart/data/remote/shipping_rates_reponse.dart';
import 'package:cart/data/remote/wishlist_response_model.dart';
import 'package:cart/datasource/cart_remote_data_source.dart';
import 'package:core/core.dart';

abstract class CartRepository {
  Future<BaseResult<List<CartItemModelData>>> getCartItems();
  Future<BaseResult<AddCartResponseData>> addCart(int itemId, int qty);
  Future<BaseResult<DeleteCartResponseData>> deleteCart(List<int> items);
  Future<BaseResult<List<GetCouponResponseData>>> getCoupon();
  Future<BaseResult<CheckoutResponseData>> checkoutItem(
      List<Map<String, int?>> items, int couponId);
  Future<BaseResult<WishlistResponseData>> getWishlistItems(
      {int page, int size, String order, String sort});
  Future<BaseResult<ShippingRatesResponseData>> getCourier();
  Future<BaseResult<CheckoutResponseData>> updateShipping(
      int shippingOptionId);
  Future<BaseResult<CheckoutResponseData>> updateCoupon(int couponId);
  Future<BaseResult<GeneratePaymentUrlResponseData>> generatePaymentUrl();
  Future<BaseResult<CheckoutResponseData>> getCheckoutData();
}

class CartRepositoryImpl extends CartRepository {
  CartRepositoryImpl(this.getCartRemoteDataSource);
  final CartRemoteDataSource getCartRemoteDataSource;

  @override
  Future<BaseResult<List<CartItemModelData>>> getCartItems() async {
    return await getCartRemoteDataSource.getCartItem();
  }

  @override
  Future<BaseResult<WishlistResponseData>> getWishlistItems(
      {int page = 1,
      int size = 5,
      String order = "desc",
      String sort = "updated"}) async {
    return await getCartRemoteDataSource.getWishlistItems(
        page: page, size: size, order: order, sort: sort);
  }

  @override
  Future<BaseResult<AddCartResponseData>> addCart(int itemId, int qty) async {
    return await getCartRemoteDataSource.addCart(itemId, qty);
  }

  @override
  Future<BaseResult<DeleteCartResponseData>> deleteCart(List<int> items) async {
    return await getCartRemoteDataSource.deleteCart(items);
  }

  @override
  Future<BaseResult<List<GetCouponResponseData>>> getCoupon() async {
    return await getCartRemoteDataSource.getCoupon();
  }

  @override
  Future<BaseResult<CheckoutResponseData>> checkoutItem(
      List<Map> items, int? couponId) async {
    return await getCartRemoteDataSource.checkoutItem(items, couponId!);
  }

  @override
  Future<BaseResult<ShippingRatesResponseData>> getCourier() async{
    return await getCartRemoteDataSource.getCourier();
  }

  @override
  Future<BaseResult<CheckoutResponseData>> updateShipping(int shippingOptionId) async{
    return await getCartRemoteDataSource.updateShipping(shippingOptionId);
  }

  @override
  Future<BaseResult<CheckoutResponseData>> updateCoupon(int couponId)async{
        return await getCartRemoteDataSource.updateCoupon(couponId);

  }

  @override
  Future<BaseResult<GeneratePaymentUrlResponseData>> generatePaymentUrl() async{
            return await getCartRemoteDataSource.generatePaymentUrl();

  }

  @override
  Future<BaseResult<CheckoutResponseData>> getCheckoutData() async{
                return await getCartRemoteDataSource.getCheckoutData();

  }
}
