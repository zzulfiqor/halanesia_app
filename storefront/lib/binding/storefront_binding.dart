import 'package:get/get.dart';
import 'package:storefront/controller/fragment_product_controller.dart';
import 'package:storefront/controller/fragment_quotation_controller.dart';
import 'package:storefront/controller/storefront_controller.dart';
import 'package:storefront/usecases/create_wishlist_usecase.dart';
import 'package:storefront/usecases/delete_wishlist_usecase.dart';
import 'package:storefront/usecases/get_merchant_detail_usecase.dart';
import 'package:storefront/usecases/get_merchant_product_usecase.dart';
import 'package:storefront/usecases/get_merchant_rating_usecase.dart';
import 'package:storefront/usecases/get_merchant_workhour_usecase.dart';
import '../usecases/get_quotation_usecase.dart';

class StorefrontBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetQuotationUseCase(Get.find()));
    Get.lazyPut(() => GetMerchantProductUseCase(Get.find()));
    Get.lazyPut(() => GetMerchantDetailUseCase(Get.find()));
    Get.lazyPut(() => GetMerchantRatingUseCase(Get.find()));
    Get.lazyPut(() => GetMerchantWorkhourUseCase(Get.find()));
    Get.lazyPut(() => CreateMerchantWishlistUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => DeleteMerchantWishlistUseCase(Get.find()), fenix: true);

    Get.lazyPut(() => StorefrontController());
    Get.lazyPut(() => FragmentQuotationController());
    Get.lazyPut(() => FragmentProductController());
  }
}
