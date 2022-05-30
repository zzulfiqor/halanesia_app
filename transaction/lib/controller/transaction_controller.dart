import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transaction/data/request/order_accept_response.dart';
import 'package:transaction/data/request/transaction_response.dart';
import 'package:transaction/transaction.dart';
import 'package:transaction/usecases/post_transaction_accept_usecase.dart';

class TransactionController extends BaseController {
  // Usecases
  late final GetTransactionListUseCase getTransactionListUseCase;
  late final PostTransactionAcceptUseCase postTransactionAcceptUseCase;

  // Refresh Controller
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final _selectedFilter = "buy".obs;
  String get selectedFilter => _selectedFilter.value;
  set selectedFilter(String value) => _selectedFilter.value = value;

  // Transaction Loading
  final _isTransactionLoading = false.obs;
  bool get isTransactionLoading => _isTransactionLoading.value;
  set isTransactionLoading(bool value) => _isTransactionLoading.value = value;

  // Transaction Response
  final _transactionResponse = TransactionResponse().obs;
  TransactionResponse get transactionResponse => _transactionResponse.value;
  set transactionResponse(TransactionResponse value) =>
      _transactionResponse.value = value;

  @override
  void onInit() {
    super.onInit();
    getTransactionListUseCase = Get.find();
    postTransactionAcceptUseCase = Get.find();
    selectedFilter = "Beli";
    getTransactionItem();
  }

  // select filter
  void selectFilter(String filter) {
    selectedFilter = filter;
    getTransactionItem(type: filter == "Beli" ? "buy" : "sell");
  }

  // Get Transaction Items
  Future<void> getTransactionItem({
    int page = 1,
    int size = 5,
    String type = "buy",
  }) async {
    selectedFilter = type == 'buy' ? 'Beli' : 'Jual';

    isTransactionLoading = true;
    final response = await getTransactionListUseCase({
      'page': page,
      'size': size,
      'type': type,
    });

    safeCallApi<TransactionResponse>(response, onSuccess: (response) {
      transactionResponse = response ?? TransactionResponse();
      isTransactionLoading = false;
    }, onError: (code, message) {
      isTransactionLoading = false;
      showCommonDialog(message);
    });
  }

  // accept order (seller)
  Future<void> acceptOrder(String transactionId) async {
    isTransactionLoading = true;
    final response =
        await postTransactionAcceptUseCase(int.parse(transactionId));

    safeCallApi<OrderAcceptResponseData>(response, onSuccess: (response) {
      showCommonDialog("Pesanan diterima.");
      getTransactionItem();
      isTransactionLoading = false;
    }, onError: (code, message) {
      isTransactionLoading = false;
      showCommonDialog(message);
    });
  }
}
