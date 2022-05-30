import 'package:core/base/base_controller.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:storefront/data/request/create_wishlist_response.dart';
import 'package:storefront/data/request/delete_wishlist_response.dart';
import 'package:storefront/usecases/create_wishlist_usecase.dart';
import 'package:storefront/usecases/delete_wishlist_usecase.dart';

class MerchantProductCardController extends BaseController {
 late final CreateMerchantWishlistUsecase createWishlistUsecase;
  late final DeleteMerchantWishlistUseCase deleteWishlistUseCase;

  final Rx<bool> _isFavorite = false.obs;
  set isFavorite(bool isFavorite) => _isFavorite.value = isFavorite;
  bool get isFavorite => _isFavorite.value;

  @override
  void onInit() {
    super.onInit();
    createWishlistUsecase = Get.find();
    deleteWishlistUseCase = Get.find();
  }

  Future<void> createWishlist(int productId) async {
    CommonDialog().showLoadingDialog();
    final response = await createWishlistUsecase(productId);
    safeCallApi<CreateWishlistResponse>(response, onSuccess: (response) {
      isFavorite = true;
      Get.back();
    }, onError: (code, message) {
      Get.back();
      showCommonDialog(message);
    });
  }

  Future<void> deleteWishlist(int productDetailId) async {
    CommonDialog().showLoadingDialog();
    final response = await deleteWishlistUseCase(productDetailId);
    safeCallApi<DeleteWishlistResponse>(response, onSuccess: (response) {
      isFavorite = false;
      Get.back();
    }, onError: (code, message) {
      Get.back();
      showCommonDialog(message);
    });
  }
}
