import 'package:core/base/base_controller.dart';
import 'package:core/base/base_response.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home/data/remote/banner_entity.dart';
import 'package:home/data/remote/cart_item_model.dart';
import 'package:home/data/remote/product_entity.dart';
import 'package:home/data/remote/quotation_list_response.dart';
import 'package:home/data/remote/recent_product_response.dart';
import 'package:home/data/remote/recomendation_item_reponse.dart';
import 'package:home/usecases/get_cart_item_home_usecase.dart';
import 'package:home/usecases/get_promo_usecase.dart';
import 'package:home/usecases/get_quotation_usecase.dart';
import 'package:home/usecases/get_recent_product_usecase.dart';
import 'package:home/usecases/get_recomendation_buyer_usecase.dart';
import 'package:home/usecases/get_recomendation_supplier.dart';
import 'package:profile/data/response/user_info_response.dart';
import 'package:profile/usecase/user/get_user_info_usecase.dart';

class HomeController extends BaseController {
  late final GetPromoUsecase getPromoUsecase;
  late final GetMerchantQuotationUseCase getQuotationUseCase;
  late final GetRecomendationBuyerUseCase getRecomendationBuyerUseCase;
  late final GetRecomendationSupplierUseCase getRecomendationSupplierUseCase;
  late final GetUserInfoUseCase getUserInfoUseCase;
  late final GetRecentProductUsecase getRecentProductUsecase;
  late final GetCartItemHomeUseCase getCartItemHomeUseCase;

  var listQuotationPageController = PageController().obs;
  var recomendationBuyerPageController = PageController().obs;
  var recomendationSupplierController = PageController().obs;

  final _bottomNavbarIndex = 0.obs;
  int get bottomNavbarIndex => _bottomNavbarIndex.value;

  final _listQuotationPageIndex = 0.obs;
  int get listQuotationPageIndex => _listQuotationPageIndex.value;

  final _recomendationBuyerPageIndex = 0.obs;
  int get recomendationBuyerPageIndex => _recomendationBuyerPageIndex.value;

  final _recomendationSupplierPageIndex = 0.obs;
  int get recomendationSupplierPageIndex =>
      _recomendationSupplierPageIndex.value;

  final _cartCount = 0.obs;
  int get cartCount => _cartCount.value;
  set cartCount(int count) => _cartCount.value = count;

  var listBanner = <BannerEntity>[].obs;

  var listQuotation = <QuotationEntity>[].obs;
  var splittedQuotation = <List<QuotationEntity>>[].obs;

  var recomendationBuyer = <RecomendationEntity>[].obs;
  var splittedRecomendationBuyer = <List<RecomendationEntity>>[].obs;

  var recomendationSupplier = <RecomendationEntity>[].obs;
  var splittedRecomendationSupplier = <List<RecomendationEntity>>[].obs;

  var recentProducts = <ProductEntity>[].obs;

  var quotaionLoading = true.obs;
  var recentProductLoading = true.obs;
  var recomendationBuyerLoading = false.obs;
  var recomendationSupplierLoading = false.obs;
  var profileLoading = false.obs;

  var hasMerchant = false.obs;
  var name = "".obs;
  var image = "".obs;
  var email = "".obs;

  @override
  void onInit() {
    super.onInit();
    getPromoUsecase = Get.find();
    getQuotationUseCase = Get.find();
    getRecomendationBuyerUseCase = Get.find();
    getRecomendationSupplierUseCase = Get.find();
    getUserInfoUseCase = Get.find();
    getRecentProductUsecase = Get.find();
    getCartItemHomeUseCase = Get.find();

    initHomeDataLoad();
  }

  Future<void> initHomeDataLoad() async {
    await getCartCount();
    await getBanner();
    await getQuotation();
    // await getRecomendationBuyer();
    // await getRecomendationSupplier();
    getData();
    await getProfile();
    await getRecentProduct();
  }

  Future<void> getBanner() async {
    final response = await getPromoUsecase(NoParams());
    safeCallApi<List<BannerEntity>>(response, onSuccess: (response) {
      listBanner.value = response ?? [];
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  Future<void> getQuotation({int page = 1}) async {
    quotaionLoading.value = true;
    final response = await getQuotationUseCase(1);
    safeCallApi<QuotationListResponse>(response, onSuccess: (response) {
      // empty the list
      listQuotation.clear();
      splittedQuotation.clear();

      // populate response to listQuotation
      response?.items?.forEach((element) {
        // add response to list quotation
        listQuotation.add(element ?? QuotationEntity());
      });

      // split list
      for (var i = 0; i < listQuotation.length; i += 2) {
        splittedQuotation.add(listQuotation.sublist(
            i, i + 2 > listQuotation.length ? listQuotation.length : i + 2));
      }
    }, onError: (code, message) {
      showCommonDialog(message);
    });
    quotaionLoading.value = false;
  }

  void setPageQuotation(int page) {
    _listQuotationPageIndex.value = page;
  }

  Future<void> getRecentProduct({int page = 1}) async {
    recentProductLoading.value = true;
    final response = await getRecentProductUsecase(page);
    safeCallApi<RecentProductResponse>(response, onSuccess: (response) {
      if (response?.hasProduct == true) {
        recentProducts.value = response?.items ?? [];
      } else {
        recentProducts.value = [];
      }
      recentProductLoading.value = false;
    }, onError: (code, message) {
      recentProductLoading.value = false;
      showCommonDialog(message);
    });
  }

  Future<void> getRecomendationBuyer() async {
    recomendationBuyerLoading.value = true;
    final response = await getRecomendationBuyerUseCase(1);
    safeCallApi<RecomendationResponse>(response, onSuccess: (response) {
      response?.items?.forEach((element) {
        recomendationBuyer.add(element);
      });
      for (var i = 0; i < recomendationBuyer.length; i += 6) {
        splittedRecomendationBuyer.add(recomendationBuyer.sublist(
            i,
            i + 6 > recomendationBuyer.length
                ? recomendationBuyer.length
                : i + 6));
      }

      recomendationBuyerLoading.value = false;
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  void setPageRecomendationBuyer(int page) {
    _recomendationBuyerPageIndex.value = page;
  }

  Future<void> getRecomendationSupplier() async {
    recomendationSupplierLoading.value = true;
    final response = await getRecomendationSupplierUseCase(1);
    safeCallApi<RecomendationResponse>(response, onSuccess: (response) {
      response?.items?.forEach((element) {
        recomendationSupplier.add(element);
      });
      for (var i = 0; i < recomendationSupplier.length; i += 6) {
        splittedRecomendationSupplier.add(recomendationSupplier.sublist(
            i,
            i + 6 > recomendationSupplier.length
                ? recomendationSupplier.length
                : i + 6));
      }

      recomendationSupplierLoading.value = false;
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  void setPageRecomendationSupplier(int page) {
    _recomendationSupplierPageIndex.value = page;
  }

  void setBottomNavbarIndex(int index) {
    _bottomNavbarIndex.value = index;
    update();
  }

  Future<bool> onPressBack() async {
    // if bottom navbar is not on main page
    if (bottomNavbarIndex != 0) {
      setBottomNavbarIndex(0);
      return false;
    }

    // if bottom navbar is on main page

    // if nack pressed once
    if (Get.isSnackbarOpen == false) {
      Get.rawSnackbar(
          message: "Tekan sekali lagi untuk keluar dari aplikasi.",
          snackStyle: SnackStyle.FLOATING);
      return false;
    }

    // if back pressed twice
    if (Get.isSnackbarOpen == true) {
      Get.back();
      return true;
    }

    return false;
  }

  void getData() {
    name.value = cacheManager.getNameUser();
    image.value = cacheManager.getImageUser();
    email.value = cacheManager.getEmailUser();
    hasMerchant.value = cacheManager.getHasMerchant();
  }

  Future<void> getCartCount() async {
    final response = await getCartItemHomeUseCase(NoParams());
    safeCallApi<List<CartItemModelData>>(response, onSuccess: (response) {
      cartCount = 0;
      if (response != null) {
        for (var element in response) {
          var productLength = element.merchant?.product?.length ?? 0;
          cartCount = cartCount + productLength;
        }
      }
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  Future<void> getProfile() async {
    profileLoading.value = true;

    final response = await getUserInfoUseCase();

    safeCallApi<UserInfoResponse>(response,
        onLoad: (status) => profileLoading.value = status,
        onSuccess: (response) {
          name.value = response?.fullname ?? "";
          image.value = response?.imgPath ?? "";
          email.value = response?.email ?? "";

          hasMerchant.value = response?.hasMerchant ?? false;

          cacheManager.saveBasicProfile(name.value, image.value, email.value,
              response?.phone ?? "-", hasMerchant.value);
          //Todo: ask for province, city, suburb
          cacheManager.saveAddressUser(
            response?.address?.address1 ?? "-",
            response?.address?.address2 ?? "-",
            response?.address?.city ?? "",
            response?.address?.state ?? "",
            response?.address?.country ?? "",
            response?.address?.postalCode ?? "",
            response?.address?.refShipperCountryId ?? 0,
            response?.address?.refShipperProvinceId ?? 0,
            response?.address?.refShipperCityId ?? 0,
            response?.address?.refShipperSuburbId ?? 0,
            response?.address?.refShipperAreaId ?? 0,
          );
        },
        onError: (code, message) {
          showCommonDialog(message);
        });

    profileLoading.value = false;
  }
}
