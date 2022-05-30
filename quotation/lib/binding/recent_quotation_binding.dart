import 'package:get/get.dart';
import 'package:quotation/controller/recent_quotation_controller.dart';
import 'package:quotation/usecase/get_quotation_list_usecase.dart';

class RecentQuotationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetQuotationListUsecase(Get.find()));

    Get.lazyPut(() => RecentQuotationController());
  }
}
