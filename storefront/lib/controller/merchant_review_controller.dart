import 'package:core/base/base_controller.dart';
import 'package:core/base/base_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:storefront/data/request/merchant_review_response.dart';
import 'package:storefront/usecases/get_merchant_review_usecase.dart';

class MerchantReviewController extends BaseController {
  late final GetMerchantReviewUseCase getMerchantReviewUseCase;

  ScrollController scrollController = ScrollController();

  final _rating = "0".obs;
  String get rating => _rating.value;
  set rating(String value) => _rating.value = value;

  final _listReview = <MerchantReviewEntity>[].obs;
  List<MerchantReviewEntity> get listReview => _listReview;
  set listReview(List<MerchantReviewEntity> value) => _listReview.value = value;

  final _isFirstLoad = true.obs;
  bool get isFirstLoad => _isFirstLoad.value;

  var currentPage = 1;
  var totalPage = 0;
  var totalReview = 0.obs;

  final _isFabVisible = false.obs;
  bool get isFabVisible => _isFabVisible.value;

  @override
  void onInit() {
    super.onInit();
    getMerchantReviewUseCase = Get.find();
    rating = Get.arguments;
    scrollController.addListener(() {
      if (scrollController.offset > 50) {
        _isFabVisible.value = true;
      } else if (scrollController.offset < 50) {
        _isFabVisible.value = false;
      }
    });
    initialLoad();
  }

  Future<void> initialLoad() async {
    listReview.clear();
    _isFirstLoad.value = true;
    getQuotations(1);
  }

  Future<void> loadMore() async {
    if (currentPage < totalPage) {
      currentPage++;
      getQuotations(currentPage);
    }
  }

  Future<void> refreshPage() async {
    currentPage = 1;
    totalPage = 0;
    listReview = [];
    initialLoad();
  }

  Future<void> getQuotations(int page) async {
    final response = await getMerchantReviewUseCase(
        {'page': page, 'merchantId': int.parse(Get.parameters['id']!)});
    safeCallApi<MerchantReviewResponse>(response, onSuccess: (response) {
      _isFirstLoad.value = false;
      totalReview.value = response?.totalItems ?? 0;
      if (response != null) {
        if (response.items!.isEmpty) {
          currentPage = 1;
          totalPage = 0;
        } else {
          totalPage = response.totalPages!;
          currentPage = response.currentPage!;
          if (response.items != null) {
            listReview.addAll(response.items!.toList());
          } else {
            listReview.addAll([]);
          }
        }
      } else {
        currentPage = 1;
        totalPage = 0;
      }
    }, onError: (code, message) {
      currentPage = 1;
      totalPage = 0;
    });
  }

  void backToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }
}
