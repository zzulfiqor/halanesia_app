import 'package:get/get.dart';
import 'package:home/controller/home_controller.dart';
import 'package:home/usecases/create_wishlist_usecase.dart';
import 'package:home/usecases/delete_wishlist_usecase.dart';
import 'package:home/usecases/get_cart_item_home_usecase.dart';
import 'package:home/usecases/get_promo_usecase.dart';
import 'package:home/usecases/get_quotation_usecase.dart';
import 'package:home/usecases/get_recent_product_usecase.dart';
import 'package:home/usecases/get_recomendation_buyer_usecase.dart';
import 'package:home/usecases/get_recomendation_supplier.dart';
import 'package:profile/usecase/user/get_user_info_usecase.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetPromoUsecase(Get.find()));
    Get.put(GetMerchantQuotationUseCase(Get.find()));
    Get.put(GetRecomendationBuyerUseCase(Get.find()));
    Get.put(GetRecomendationSupplierUseCase(Get.find()));
    Get.put(GetUserInfoUseCase(Get.find()));
    Get.put(GetRecentProductUsecase(Get.find()));
    Get.put(CreateWishlistUsecase(Get.find()));
    Get.put(DeleteWishlistUseCase(Get.find()));
    Get.put(GetCartItemHomeUseCase(Get.find()));

    Get.put(HomeController(), permanent: true);
  }
}
