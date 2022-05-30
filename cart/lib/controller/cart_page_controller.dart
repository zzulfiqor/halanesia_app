import 'dart:developer';

import 'package:cart/data/model/checkout_data_model.dart';
import 'package:cart/data/model/promo_model.dart';
import 'package:cart/data/remote/add_cart_response.dart';
import 'package:cart/data/remote/cart_item_model.dart';
import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/data/remote/get_coupon_response.dart';
import 'package:cart/data/remote/wishlist_response_model.dart';
import 'package:cart/usecases/checkout_cart_usecase.dart';
import 'package:cart/usecases/get_cart_items_usecase.dart';
import 'package:cart/usecases/get_coupon_usecase.dart';
import 'package:cart/usecases/get_wishlist_items_cart_usecase.dart';
import 'package:cart/usecases/update_cart_usecase.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartPageController extends BaseController {
  late final GetCartItemsUseCase getCartItemsUsecase;
  late final GetWishlistItemsCartUseCase getWishlistItemsCartUseCase;
  late final GetCouponUseCase getCouponUseCase;
  late final UpdateCartUseCase updateCartUseCase;
  late final CheckoutCartUseCase checkoutCartUseCase;

  // Refresh Controller
  RefreshController refreshController = RefreshController();

  final _selectedPromo = PromoModel().obs;
  PromoModel get selectedPromo => _selectedPromo.value;
  set selectedPromo(PromoModel value) => _selectedPromo.value = value;

  final _selectedCoupon = GetCouponResponseData().obs;
  GetCouponResponseData get selectedCoupon => _selectedCoupon.value;
  set selectedCoupon(GetCouponResponseData value) =>
      _selectedCoupon.value = value;

  final _couponItems = <GetCouponResponseData>[].obs;
  List<GetCouponResponseData> get couponItems => _couponItems;
  set couponItems(List<GetCouponResponseData> value) =>
      _couponItems.value = value;

  // Cart Items
  var cartItemLoading = false.obs;
  final cartItems = <CartItemModelData>[].obs;
  List<CartItemModelData> get cartItemsValue => cartItems;
  set cartItemsValue(List<CartItemModelData> value) => cartItems.value = value;
  var cartItemsData = <CheckoutDataModel>[];

  // Wishlist Items
  var wishlistItemLoading = false.obs;
  final wishlistItems = WishlistResponseData().obs;
  WishlistResponseData get wishlistItemsValue => wishlistItems.value;
  set wishlistItemsValue(WishlistResponseData value) =>
      wishlistItems.value = value;

  // is checking out
  var isCheckingOut = false.obs;

  // add cart
  var isUpdating = false.obs;

  // init
  final _isInitLoad = true.obs;
  bool get isInitLoad => _isInitLoad.value;
  set isInitLoad(bool val) => _isInitLoad.value = val;

  // total price
  final totalPrice = 0.obs;
  int get totalPriceValue => totalPrice.value;
  set totalPriceValue(int value) => totalPrice.value = value;

  // Get Cart Items
  Future<void> getCartItems() async {
    cartItemLoading.value = true;
    final response = await getCartItemsUsecase(NoParams());
    safeCallApi<List<CartItemModelData>>(response, onSuccess: (response) {
      isInitLoad = false;
      cartItems.value = response ?? [];
      cartItemLoading.value = false;
      // total price
      totalPriceValue = 0;
      response?.forEach((element) {
        element.merchant?.product?.forEach((product) {
          int qty = product?.productDetail?[0]?.cart?.qt ?? 0;
          int price = product?.productDetail?[0]?.prices?[0]?.price ?? 0;
          int total = qty * price;
          totalPriceValue += total;
        });
      });

      // cart item data
      cartItemsData = [];
      response?.forEach((element) {
        element.merchant?.product?.forEach((product) {
          cartItemsData.add(CheckoutDataModel(
            id: int.parse(product?.productDetail?[0]?.id ?? '0'),
            qty: product?.productDetail?[0]?.cart?.qt,
          ));
        });
      });
    }, onError: (code, message) {
      cartItemLoading.value = false;
      showCommonDialog(message);
    });
  }

  // Get Coupon Items
  Future<void> getCoupon() async {
    final response = await getCouponUseCase(NoParams());
    safeCallApi<List<GetCouponResponseData>>(response, onSuccess: (response) {
      couponItems = response ?? [];
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  // Get Wishlist Items
  Future<void> getWishlistItems({
    int page = 1,
    int size = 5,
    String order = "desc",
    String sort = "updated",
  }) async {
    wishlistItemLoading.value = true;
    final response = await getWishlistItemsCartUseCase({
      'page': page,
      'size': size,
      'order': order,
      'sort': sort,
    });
    safeCallApi<WishlistResponseData>(response, onSuccess: (response) {
      wishlistItems.value = response ?? WishlistResponseData();
      wishlistItemLoading.value = false;
    }, onError: (code, message) {
      wishlistItemLoading.value = false;
      showCommonDialog(message);
    });
  }

  // Add Cart
  Future<void> addCart(int itemId, int qty) async {
    isUpdating.value = true;
    final response = await updateCartUseCase({
      'itemId': itemId,
      'qty': qty,
    });
    safeCallApi<AddCartResponseData>(response, onSuccess: (response) {
      Get.rawSnackbar(message: response?.remark ?? "Success");
    }, onError: (code, message) {
      showCommonDialog(message);
    });
    isUpdating.value = false;
  }

  // Checkout Cart
  Future<void> checkoutCart() async {
    isCheckingOut.value = true;
    var data = selectedCoupon.id != null
        ? {
            'items': cartItemsData
                .map((e) => {
                      'product_detail_id': e.id,
                      'quantity': e.qty!,
                    })
                .toList(),
            'coupon_id': int.parse(selectedCoupon.id ?? '0'),
          }
        : {
            'items': cartItemsData
                .map((e) => {
                      'product_detail_id': e.id,
                      'quantity': e.qty!,
                    })
                .toList()
          };
    log(data.toString());
    final response = await checkoutCartUseCase(data);
    safeCallApi<CheckoutResponseData>(response, onSuccess: (response) {
      Get.toNamed(RouteName.directBuy);
    }, onError: (code, message) {
      showCommonDialog(message);
    });
    isCheckingOut.value = false;
  }

  // On refresh
  void onRefresh() {
    isInitLoad = true;
    getCartItems();
    getCoupon();
    getWishlistItems();
  }

  @override
  void onInit() {
    super.onInit();
    getCartItemsUsecase = Get.find();
    getWishlistItemsCartUseCase = Get.find();
    getCouponUseCase = Get.find();
    updateCartUseCase = Get.find();
    checkoutCartUseCase = Get.find();
    getCartItems();
    getWishlistItems();
    getCoupon();
  }
}
