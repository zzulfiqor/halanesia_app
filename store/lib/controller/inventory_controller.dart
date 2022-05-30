import 'package:core/base/base_controller.dart';
import 'package:core/base/base_response.dart';
import 'package:get/get.dart';
import 'package:core/entity/empty_response.dart';
import 'package:store/data/merchant_product_response.dart';
import 'package:store/data/product_entity.dart';
import 'package:store/usecases/get_merchant_product_usecase.dart';
import 'package:store/usecases/update_product_price_usecase.dart';
import 'package:store/usecases/update_product_stock_usecase.dart';

class InventoryController extends BaseController {
  late final GetMerchantProductUseCase getMerchantProductUseCase;
  late final UpdateProductPriceUseCase updateProductPriceUseCase;
  late final UpdateProductStockUseCase updateProductStockUseCase;

  final _merchantProduct = <ProductEntity>[].obs;

  List<ProductEntity> get product => _merchantProduct.toList();
  final _lastPage = false.obs;

  bool get lastPage => _lastPage.value;

  final _isFirstLoad = true.obs;

  bool get isFirstLoad => _isFirstLoad.value;

  var hasProduct = true.obs;

  var currentPage = 1;
  var totalPage = 0;

  @override
  void onInit() {
    super.onInit();
    getMerchantProductUseCase = Get.find();
    updateProductPriceUseCase = Get.find();
    updateProductStockUseCase = Get.find();
    initialLoad();
  }

  Future<void> initialLoad() async {
    _isFirstLoad.value = true;
    _merchantProduct.clear();
    getMerchantProduct(1);
  }

  Future<void> loadMore() async {
    if (currentPage < totalPage) {
      currentPage++;
      getMerchantProduct(currentPage);
    }
  }

  Future<void> getMerchantProduct(int page) async {
    final response = await getMerchantProductUseCase(page);
    safeCallApi<MerchantProductResponse>(response, onSuccess: (response) {
      _isFirstLoad.value = false;
      if (response != null) {
        if (!response.hasProduct) {
          hasProduct.value = false;
        } else {
          totalPage = response.totalPages;
          currentPage = response.currentPage;
          _merchantProduct.addAll(response.items);
        }
      } else {
        Get.back();
      }
    }, onError: (code, message) {
      commonDialog.showCommonDialog(message, onPressed: () {
        Get.back();
      });
    });
  }

  Future<void> updateProductPrice(int productId, int price) async {
    final response = await updateProductPriceUseCase(
        {'price': price, 'productId': productId});
    safeCallApi<EmptyResponse>(response, onSuccess: (response) {
      initialLoad();
    }, onError: (code, message) {});
  }

  Future<void> updateProductStock(int productId, int stock) async {
    final response = await updateProductStockUseCase(
        {'stock': stock, 'productId': productId});
    safeCallApi<EmptyResponse>(response, onSuccess: (response) {
      initialLoad();
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }
}
