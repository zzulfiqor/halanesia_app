import 'package:core/core.dart';
import 'package:get/get.dart';

class ProfileReviewController extends BaseController {

  var source = "".obs;
  var title = "".obs; 
  var category = 0.obs;
  var options = <OptionModel>[].obs;

  // var reviewList = <ReviewItem>[].obs;
  // List<ReviewItem> get review => reviewList.toList();
  
  final _lastPage = false.obs;
  bool get lastPage => _lastPage.value;

  final _isFirstLoad = true.obs;
  bool get isFirstLoad => _isFirstLoad.value;

  var currentPage = 1;
  var totalPage = 0;

  @override
  void onInit() {
    super.onInit();
    source.value = Get.parameters['source'] ?? "";

    if(source.value == "merchant"){
      title.value = "Ulasan Toko";
      options.value = [
        OptionModel(true, "Ulasan Produk"),
        OptionModel(false, "Dari Pembeli"),
        OptionModel(false, "Oleh Toko"),
      ];
    }else{
      title.value = "Ulasan Saya";
      options.value = [
        OptionModel(true, "Ulasan Produk"),
        OptionModel(false, "Dari Toko"),
        OptionModel(false, "Oleh Saya"),
      ];
    }
  }

  void setOption(int pos) {
    options.asMap().forEach((index, data) =>
      data.isSelected = pos == index
    );
    category.value = pos;
    options.refresh();
  }

  Future<void> initialLoad() async {
    _isFirstLoad.value = true;
    // getProductReview(1);
  }

  Future<void> loadMore() async {
    if (currentPage < totalPage) {
      currentPage++;
      // getProductReview(currentPage);
    }
  }
}