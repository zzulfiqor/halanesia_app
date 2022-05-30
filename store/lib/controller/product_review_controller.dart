import 'package:core/base/base_controller.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:store/data/page_size_request.dart';
import 'package:store/data/product_review_response.dart';
import 'package:store/usecases/get_product_review_usecase.dart';

class ProductReviewController extends BaseController {
  
  late final GetProductReviewUseCase getProductReviewUseCase;
  
  var id = 0.obs;

  var reviewList = <ReviewItem>[].obs;
  List<ReviewItem> get review => reviewList.toList();
  
  final _lastPage = false.obs;
  bool get lastPage => _lastPage.value;

  final _isFirstLoad = true.obs;
  bool get isFirstLoad => _isFirstLoad.value;

  var currentPage = 1;
  var totalPage = 0;
  
  @override
  void onInit() {
    super.onInit();
    getProductReviewUseCase = Get.find<GetProductReviewUseCase>();
    
    id.value = int.parse(Get.parameters['id'] ?? "0");

    initialLoad();
  }

  Future<void> initialLoad() async {
    _isFirstLoad.value = true;
    getProductReview(1);
  }

  Future<void> loadMore() async {
    if (currentPage < totalPage) {
      currentPage++;
      getProductReview(currentPage);
    }
  }

  Future<void> getProductReview(int page) async{
    var data = PageSizeRequest(id: id.value, page: page, size: 20);

    final response = 
      await getProductReviewUseCase(data);

    safeCallApi<ProductReviewResponse>(response, 
      onSuccess: (response) {
        _isFirstLoad.value = false;
        if(response!=null){
          if (!response.hasItem) {
            currentPage = 1;
            totalPage = 0;
            _lastPage.value = true;
          } else {
            totalPage = response.totalPages ?? 1;
            currentPage = response.currentPage ?? 0;
            reviewList.addAll(response.items ?? <ReviewItem>[]);
          }
        } else {
          currentPage = 1;
          totalPage = 0;
          _lastPage.value = true;
        }
      }, onError: (code, message) {
        commonDialog.showCommonDialog(message);
      }
    );
  }


}
