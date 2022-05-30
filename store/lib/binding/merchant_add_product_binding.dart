import 'package:get/get.dart';
import 'package:store/controller/add_inventory_controller.dart';
import 'package:store/usecases/put_merchant_product_usecase.dart';
import 'package:store/usecases/update_product_price_usecase.dart';
import 'package:store/usecases/update_product_stock_usecase.dart';

import '../usecases/get_product_category_usecase.dart';
import '../usecases/post_merchant_image_usecase.dart';

class MerchantAddProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GetProductCategoryUseCase(Get.find()));
    Get.put(PutMerchantProductUseCase(Get.find()));
    Get.put(PostMerchantImageUseCase(Get.find()));
    Get.put(AddInventoryController());
  }
}
