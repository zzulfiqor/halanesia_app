import 'package:core/base/base_controller.dart';
import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:store/data/page_size_request.dart';
import 'package:store/data/product_review_image_response.dart';
import 'package:store/usecases/get_product_review_image_usecase.dart';

class ProductReviewAllImageController extends BaseController {
  
  late final GetProductReviewImageUseCase getProductReviewImageUseCase;
  
  var id = 0.obs;

  var imageReviewData = <ReviewImageItem>[].obs;
  List<ReviewImageItem> get review => imageReviewData.toList();

  final _lastPage = false.obs;
  bool get lastPage => _lastPage.value;

  final _isFirstLoad = true.obs;
  bool get isFirstLoad => _isFirstLoad.value;

  var currentPage = 1;
  var totalPage = 0;
  
  @override
  void onInit() {
    super.onInit();
    getProductReviewImageUseCase = Get.find<GetProductReviewImageUseCase>();
    
    id.value = int.parse(Get.parameters['id'] ?? "0");

    initialLoad();
  }

   Future<void> initialLoad() async {
    _isFirstLoad.value = true;
    getProductReviewImage(1);
  }

  Future<void> loadMore() async {
    if (currentPage < totalPage) {
      currentPage++;
      getProductReviewImage(currentPage);
    }
  }


  void getProductReviewImage(int page) async{
    var data = PageSizeRequest(id: id.value, page: page, size: 10);

    final response =
      await getProductReviewImageUseCase(data);

    safeCallApi<ProductReviewImageResponse>(response,
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
            imageReviewData.addAll(response.items ?? <ReviewImageItem>[]);
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
