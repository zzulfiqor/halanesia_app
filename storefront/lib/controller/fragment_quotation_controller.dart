import 'package:core/base/base_controller.dart';
import 'package:core/base/base_response.dart';
import 'package:get/get.dart';
import 'package:storefront/data/request/quotation_list_response.dart';
import 'package:storefront/usecases/get_quotation_usecase.dart';

class FragmentQuotationController extends BaseController {
  late final GetQuotationUseCase getQuotationUseCase;

  final _quotationList = <QuotationEntity>[].obs;

  List<QuotationEntity> get quotations => _quotationList.toList();

  final _isFirstLoad = true.obs;
  bool get isFirstLoad => _isFirstLoad.value;

  var currentPage = 1;
  var totalPage = 0;

  @override
  void onInit() {
    super.onInit();
    getQuotationUseCase = Get.find();

    initialLoad();
  }

  Future<void> initialLoad() async {
    _quotationList.clear();
    _isFirstLoad.value = true;
    getQuotations(1);
  }

  void loadMore() async {
    if (currentPage < totalPage) {
      currentPage++;
      getQuotations(currentPage);
    }
  }

  Future<void> refreshPage() async {
    currentPage = 1;
    totalPage = 0;
    _quotationList.value = [];
    initialLoad();
  }

  Future<void> getQuotations( int page) async {
    final response = await getQuotationUseCase(
        {'page': page, 'merchantId': int.parse(Get.parameters['id']!)});
    safeCallApi<QuotationListResponse>(response, onSuccess: (response) {
      _isFirstLoad.value = false;
      if (response != null) {
        if (response.items!.isEmpty) {
          currentPage = 1;
          totalPage = 0;
        } else {
          totalPage = response.totalPages!;
          currentPage = response.currentPage!;
          if (response.items != null) {
            _quotationList.addAll(response.items!.toList());
          } else {
            _quotationList.addAll([]);
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
