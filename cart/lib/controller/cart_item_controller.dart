import 'package:cart/controller/cart_page_controller.dart';
import 'package:cart/data/remote/add_cart_response.dart';
import 'package:cart/data/remote/delete_cart_response.dart';
import 'package:cart/usecases/delete_cart_usecase.dart';
import 'package:cart/usecases/update_cart_usecase.dart';
import 'package:core/base/base_controller.dart';
import 'package:core/base/base_response.dart';
import 'package:get/get.dart';

class CartItemController extends BaseController {
  final int tag;

  CartItemController(this.tag);

  late final UpdateCartUseCase updateCartUseCase;
  late final DeleteCartUseCase deleteCartUseCase;

  var oldItemCount = 0;

  final _itemCount = 0.obs;
  int get itemCount => _itemCount.value;
  set itemCount(int value) => _itemCount.value = value;

  var isUpdating = false.obs;
  var isAfterInit = false.obs;

  void countAdd(int stock) {
    if (itemCount <= stock) {
      itemCount++;
    }
  }

  void countSub(int stock) {
    if (itemCount >= 1) {
      _itemCount.value--;
    }
  }

  // Delete Cart
  Future<void> deleteCart(int cartId) async {
    isUpdating.value = true;
    final response = await deleteCartUseCase([cartId]);
    safeCallApi<DeleteCartResponseData>(response, onSuccess: (response) {
      isUpdating.value = false;
      Get.find<CartPageController>().getCartItems();
    }, onError: (code, message) {
      isUpdating.value = false;
      showCommonDialog(message);
    });
  }

  // Add / Update Cart
  Future<void> addCart(int itemId, int qty) async {
    final response = await updateCartUseCase({
      'itemId': itemId,
      'qty': qty,
    });
    safeCallApi<AddCartResponseData>(response, onSuccess: (response) {
      oldItemCount = itemCount;
      // Get.find<CartPageController>().getCartItems();
    }, onError: (code, message) {
      if (isAfterInit.value == true && Get.isDialogOpen == false) {
        showCommonDialog(message);
        itemCount = oldItemCount;
      }
    });
    isAfterInit.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    updateCartUseCase = Get.find();
    deleteCartUseCase = Get.find();

    // if (isAfterInit() == true && itemCount == 0) {
    //   debounce(
    //     _itemCount,
    //     (int val) {
    //       addCart(tag, itemCount);
    //     },
    //     time: const Duration(milliseconds: 500),
    //   );
    //   isAfterInit.value = false;
    // }

    debounce(
      _itemCount,
      (int val) {
        addCart(tag, itemCount);
      },
      time: const Duration(milliseconds: 500),
    );
  }
}
