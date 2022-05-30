import 'package:get/get.dart';
import 'package:transaction/controller/transaction_detail_controller.dart';
import 'package:transaction/usecases/get_transaction_detail_usecase.dart';
import 'package:transaction/usecases/post_transaction_accept_usecase.dart';

class TransactionDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetTransactionDetailUseCase(Get.find()));
    Get.lazyPut(() => PostTransactionAcceptUseCase(Get.find()));

    Get.put(TransactionDetailController());
  }
}
