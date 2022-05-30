import 'package:core/base/base_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:storefront/data/request/merchant_product_response.dart';
import 'package:storefront/usecases/get_merchant_product_usecase.dart';

class FragmentProductController extends BaseController {
  late final GetMerchantProductUseCase getMerchantProductUseCase;

  ScrollController scrollController = ScrollController();

  final _productList = <ProductEntity>[].obs;
  List<ProductEntity> get productList => _productList;

  final _isFirstLoad = true.obs;
  bool get isFirstLoad => _isFirstLoad.value;

  var currentPage = 1;
  var totalPage = 0;

  @override
  void onInit() {
    super.onInit();
    getMerchantProductUseCase = Get.find();
    initialLoad();
  }

  Future<void> initialLoad() async {
    _productList.clear();
    _isFirstLoad.value = true;
    getProducts(1);
  }

  void loadMore() async {
    if (currentPage < totalPage) {
      currentPage++;
      getProducts(currentPage);
    }
  }

  Future<void> refreshPage() async {
    currentPage = 1;
    totalPage = 0;
    _productList.value = [];
    initialLoad();
  }

  Future<void> getProducts(int page) async {
    final response =
        await getMerchantProductUseCase({'page': page, 'merchantId': int.parse(Get.parameters['id']!)});
    safeCallApi<MerchantProductResponse>(response, onSuccess: (response) {
      _isFirstLoad.value = false;
      if (response != null) {
        if (response.items!.isEmpty) {
          currentPage = 1;
          totalPage = 0;
        } else {
          totalPage = response.totalPages!;
          currentPage = response.currentPage!;
          if (response.items != null) {
            _productList.addAll(response.items!.toList());
          } else {
            _productList.addAll([]);
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
}
