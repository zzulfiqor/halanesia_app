import 'package:core/base/base_controller.dart';
import 'package:core/base/base_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotation/data/remote/quotation_list_response.dart';
import 'package:quotation/usecase/get_quotation_list_usecase.dart';

class RecentQuotationController extends BaseController {
  late GetQuotationListUsecase getQuotationListUsecase;

  // Scroll Controller
  ScrollController scrollController = ScrollController();

  // isLoading
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  // page
  final _page = 1.obs;
  int get page => _page.value;
  set page(int value) => _page.value = value;

  // quotation list
  final _quotationList = <QuotationEntity?>[].obs;
  List<QuotationEntity?> get quotationList => _quotationList.value;
  set quotationList(List<QuotationEntity?> value) =>
      _quotationList.value = value;

  // on init
  @override
  void onInit() {
    super.onInit();
    getQuotationListUsecase = GetQuotationListUsecase(Get.find());
    getQuotationList(1);
  }

  //  get quotation list
  Future<void> getQuotationList(int page) async {
    isLoading = true;
    final result = await getQuotationListUsecase.call(page);
    safeCallApi<QuotationListResponse>(result, onSuccess: (response) {
      if (page == 1) {
        // clear data
        quotationList = [];
      }

      // add response to quotationList
      quotationList = response?.items ?? <QuotationEntity?>[];
    }, onError: (code, message) {
      showCommonDialog(message);
    });

    isLoading = false;
  }

  // on refresh
  Future<void> onRefresh() async {
    page = 1;
    await getQuotationList(page);
  }
}
