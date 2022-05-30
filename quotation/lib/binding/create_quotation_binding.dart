import 'package:get/get.dart';
import 'package:quotation/controller/create_quotation_controller.dart';

class CreateQuotationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateQuotationController());
  }
}
