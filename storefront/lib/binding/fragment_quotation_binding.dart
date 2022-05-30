import 'package:get/get.dart';
import 'package:storefront/controller/fragment_quotation_controller.dart';

class FragmentQuotationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => FragmentQuotationController());
  }
}
