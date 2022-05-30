import 'package:get/get.dart';
import 'package:store/controller/inventory_controller.dart';
import 'package:store/usecases/get_merchant_product_usecase.dart';
import 'package:store/usecases/update_product_price_usecase.dart';
import 'package:store/usecases/update_product_stock_usecase.dart';

class MerchantInventoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetMerchantProductUseCase(Get.find()));
    Get.put(UpdateProductStockUseCase(Get.find()));
    Get.put(UpdateProductPriceUseCase(Get.find()));
    Get.put(InventoryController());
  }
}
