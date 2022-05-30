import 'package:core/base/base_controller.dart';
import 'package:core/base/base_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:storefront/controller/fragment_information_controller.dart';
import 'package:storefront/controller/fragment_product_controller.dart';
import 'package:storefront/controller/fragment_quotation_controller.dart';
import 'package:storefront/data/request/merchant_detail_response.dart';
import 'package:storefront/data/request/merchant_workhour_response.dart';
import 'package:storefront/usecases/get_merchant_detail_usecase.dart';
import 'package:storefront/usecases/get_merchant_rating_usecase.dart';
import 'package:storefront/usecases/get_merchant_workhour_usecase.dart';
import 'package:intl/intl.dart';

class StorefrontController extends BaseController
    with GetSingleTickerProviderStateMixin {
  late final GetMerchantDetailUseCase getMerchantDetailUseCase;
  late final GetMerchantRatingUseCase getMerchantRatingUseCase;
  late final GetMerchantWorkhourUseCase getMerchantWorkhourUseCase;

  TabController? storefrontTabController;

  ScrollController scrollController = ScrollController();

  var tabInformationController = Get.put(FragmentInformationController());
  var tabProductController = Get.put(FragmentProductController());
  var tabQuotationController = Get.put(FragmentQuotationController());

  final _merchantDetail = MerchantDetailResponse().obs;
  MerchantDetailResponse get merchantDetail => _merchantDetail.value;
  set merchantDetail(MerchantDetailResponse value) =>
      _merchantDetail.value = value;

  final _merchantRating = "0".obs;
  String get merchantRating => _merchantRating.value;
  set merchantRating(String value) => _merchantRating.value = value;

  final _merchantWorkhour = Day().obs;
  Day get merchantWorkhour => _merchantWorkhour.value;
  set merchantWorkhour(Day value) => _merchantWorkhour.value = value;

  final _merchantWorkday = <String>[].obs;
  List<String> get merchantWorkday => _merchantWorkday;
  set merchantWorkday(List<String> value) => _merchantWorkday.value = value;

  final _merchantDetailLoading = false.obs;
  bool get merchantDetailLoading => _merchantDetailLoading.value;
  set merchantDetailLoading(bool value) => _merchantDetailLoading.value = value;

  final _merchantWorkdateLoading = false.obs;
  bool get merchantWorkdateLoading => _merchantWorkdateLoading.value;
  set merchantWorkdateLoading(bool value) =>
      _merchantWorkdateLoading.value = value;

  final _merchantRatingLoading = false.obs;
  bool get merchantRatingLoading => _merchantRatingLoading.value;
  set merchantRatingLoading(bool value) => _merchantRatingLoading.value = value;

  final _isFabVisible = false.obs;
  bool get isFabVisible => _isFabVisible.value;

  @override
  void onInit() {
    super.onInit();
    getMerchantDetailUseCase = Get.find();
    getMerchantRatingUseCase = Get.find();
    getMerchantWorkhourUseCase = Get.find();
    storefrontTabController = TabController(length: 2, vsync: this);
    scrollController.addListener(() {
      if (scrollController.offset > 50) {
        _isFabVisible.value = true;
      } else if (scrollController.offset < 50) {
        _isFabVisible.value = false;
      }
    });

    getMerchantDetail();
    getMerchantRating();
    getMerchantWorkhour();
  }

  Future<void> getMerchantWorkhour() async {
    merchantWorkdateLoading = true;
    final response =
        await getMerchantWorkhourUseCase(int.parse(Get.parameters["id"]!));
    safeCallApi<MerchantWorkHourResponse>(response, onSuccess: (response) {
      // Set Workday
      // Monday
      if (response?.monday?.open == true) {
        merchantWorkday.add("Senin");
      }

      // Tuesday
      if (response?.tuesday?.open == true) {
        merchantWorkday.add("Selasa");
      }

      // Wednesday
      if (response?.wednesday?.open == true) {
        merchantWorkday.add("Rabu");
      }

      // Thursday
      if (response?.thursday?.open == true) {
        merchantWorkday.add("Kamis");
      }

      // Friday
      if (response?.friday?.open == true) {
        merchantWorkday.add("Jumat");
      }

      // Saturday
      if (response?.saturday?.open == true) {
        merchantWorkday.add("Sabtu");
      }

      // Sunday
      if (response?.sunday?.open == true) {
        merchantWorkday.add("Minggu");
      }

      // Set Workhour
      switch (DateFormat('EEEE').format(DateTime.now()).toLowerCase()) {
        case 'monday':
          merchantWorkhour = response?.monday ?? Day();
          merchantWorkdateLoading = false;

          break;
        case 'tuesday':
          merchantWorkhour = response?.tuesday ?? Day();
          merchantWorkdateLoading = false;

          break;
        case 'wednesday':
          merchantWorkhour = response?.wednesday ?? Day();
          merchantWorkdateLoading = false;

          break;
        case 'thursday':
          merchantWorkhour = response?.thursday ?? Day();
          merchantWorkdateLoading = false;

          break;
        case 'friday':
          merchantWorkhour = response?.friday ?? Day();
          merchantWorkdateLoading = false;

          break;
        case 'saturday':
          merchantWorkhour = response?.saturday ?? Day();
          merchantWorkdateLoading = false;

          break;
        case 'sunday':
          merchantWorkhour = response?.sunday ?? Day();
          merchantWorkdateLoading = false;

          break;
        default:
          merchantWorkhour = Day(open: false);
          merchantWorkdateLoading = false;
      }
    }, onError: (code, message) {
      showCommonDialog(message);
      merchantWorkdateLoading = false;
    });
  }

  Future<void> getMerchantDetail() async {
    merchantDetailLoading = true;
    final response =
        await getMerchantDetailUseCase(int.parse(Get.parameters['id']!));
    safeCallApi<MerchantDetailResponse>(response, onSuccess: (response) {
      merchantDetail = response ?? MerchantDetailResponse();
      merchantDetailLoading = false;
    }, onError: (code, message) {
      showCommonDialog(message);
      merchantDetailLoading = false;
    });
  }

  Future<void> getMerchantRating() async {
    merchantRatingLoading = true;
    final response =
        await getMerchantRatingUseCase(int.parse(Get.parameters['id']!));
    safeCallApi<String>(response, onSuccess: (response) {
      merchantRating = response ?? "0";
      merchantRatingLoading = false;
    }, onError: (code, message) {
      showCommonDialog(message);
      merchantRatingLoading = false;
    });
  }

  void backToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  bool onScrollEnd(int tabIndex) {
    switch (tabIndex) {
      case 0:
        tabProductController.loadMore();
        return true;
      case 1:
        tabQuotationController.loadMore();
        return true;
      case 2:
        // tabQuotationController.loadMore();
        return true;
      default:
        return true;
    }
  }

  void share(String url) {
    Share.share(url, subject: url);
  }
}
