import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:home/controller/home_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store/data/add_cart_response.dart';
import 'package:store/data/checkout_request.dart.dart';
import 'package:store/data/page_size_request.dart';
import 'package:store/data/product_detail_response.dart';
import 'package:store/data/product_related_request.dart';
import 'package:store/data/product_related_response.dart';
import 'package:store/data/product_review_image_response.dart';
import 'package:store/data/product_review_response.dart';
import 'package:store/usecases/get_product_detail_usecase.dart';
import 'package:store/usecases/get_product_related_usecase.dart';
import 'package:store/usecases/get_product_review_image_usecase.dart';
import 'package:store/usecases/get_product_review_usecase.dart';
import 'package:store/usecases/post_add_cart_usecase.dart';
import 'package:store/usecases/post_checkout_usecase.dart';

class ProductDetailController extends BaseController {
  late final GetProductDetailUseCase getProductDetailUseCase;
  late final GetProductRelatedUseCase getProductRelatedUseCase;
  late final GetProductReviewUseCase getProductReviewUseCase;
  late final GetProductReviewImageUseCase getProductReviewImageUseCase;
  late final PostCheckoutUseCase postCheckoutUseCase;
  late final PostAddCartUseCase postAddCartUseCase;

  var isLoading = false.obs;
  var isRelatedLoading = false.obs;
  var isImageLoading = false.obs;
  var isReviewLoading = false.obs;

  var currentCarousel = 0.obs;
  var carouselController = CarouselController();

  var imageData = <String>[].obs;
  var imageListData = <RelatedItem>[].obs;
  var imageReviewData = <ReviewImageItem>[].obs;
  var reviewList = <ReviewItem>[].obs;

  var id = 0.obs;
  var productDetailId = 0.obs;
  var productName = "".obs;
  var productPrice = "".obs;
  var productRealPrice = "".obs;
  var productDiscountPrice = "".obs;
  var productRate = "".obs;
  var productSold = "".obs;
  var merchantId = 0.obs;
  var merchantProfileImage = "".obs;
  var merchantName = "".obs;
  var merchantLocation = "".obs;
  var category = "".obs;
  var categoryId = 0.obs;
  var stock = 0.obs;
  var minOrder = 0.obs;
  var desc = "".obs;
  var isShowTag = false.obs;
  var tagText = "".obs;

  @override
  void onInit() {
    getProductDetailUseCase = Get.find<GetProductDetailUseCase>();
    getProductRelatedUseCase = Get.find<GetProductRelatedUseCase>();
    getProductReviewUseCase = Get.find<GetProductReviewUseCase>();
    getProductReviewImageUseCase = Get.find<GetProductReviewImageUseCase>();
    postCheckoutUseCase = Get.find<PostCheckoutUseCase>();
    postAddCartUseCase = Get.find<PostAddCartUseCase>();

    id.value = int.parse(Get.parameters['id'] ?? "0");
    getProductDetail();
    super.onInit();
  }

  void getProductDetail() async {
    isLoading.value = true;

    final response = await getProductDetailUseCase(id.value);

    safeCallApi<ProductDetailResponse>(response,
        onLoad: (status) => isLoading.value = status,
        onSuccess: (response) {
          if (response != null) {
            imageData.value = response.productImage ?? <String>[];

            id.value = response.productId ?? 0;
            productDetailId.value = response.productDetailId ?? 0;
            productName.value = response.productName ?? "-";
            productPrice.value = formatCurrencyWithDecimal(response.price ?? 0);
            productRealPrice.value =
                formatCurrencyWithDecimal(response.originalPrice ?? 0);
            productDiscountPrice.value = "${response.discount ?? 0} %";
            productRate.value = "${response.rating ?? 0}/5 (0 Ulasan)";
            productSold.value = "Terjual ${response.amountSold}";

            merchantProfileImage.value = response.storeImage ?? "";
            merchantName.value = response.storeName ?? "-";
            merchantLocation.value = response.storeLocation ?? "-";
            merchantId.value = response.storeId ?? 0;

            categoryId.value = response.productCategoryId ?? 0;
            category.value = response.productCategory ?? "-";
            stock.value = response.stock ?? 0;
            minOrder.value = response.minOrder ?? 0;
            desc.value = response.productDesc ?? "-";

            if (response.marketingAuthorization ?? false) {
              isShowTag.value = true;
              tagText.value = "Izin Edar PIRT";
            }
            if (response.halalCertification ?? false) {
              isShowTag.value = true;
              tagText.value = "Izin Edar BPOM";
            }
            if (response.halalMUI ?? false) {
              isShowTag.value = true;
              tagText.value = "Halal MUI";
            }

            getProductRelated();
          }
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isLoading.value = false;
  }

  void getProductRelated() async {
    isRelatedLoading.value = true;

    var data = ProductRelatedRequest(
        categoryId: categoryId.value,
        page: 1,
        size: 3,
        merchantId: merchantId.value);

    final response = await getProductRelatedUseCase(data);

    safeCallApi<ProductRelatedResponse>(response,
        onLoad: (status) => isLoading.value = status,
        onSuccess: (response) {
          if (response != null) {
            imageListData.value = response.items ?? <RelatedItem>[];

            getProductReviewImage();
          }
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isRelatedLoading.value = false;
  }

  void getProductReviewImage() async {
    isImageLoading.value = true;

    var data = PageSizeRequest(id: id.value, page: 1, size: 3);

    final response = await getProductReviewImageUseCase(data);

    safeCallApi<ProductReviewImageResponse>(response,
        onLoad: (status) => isLoading.value = status,
        onSuccess: (response) {
          if (response != null) {
            imageReviewData.value = response.items ?? <ReviewImageItem>[];
            getProductReview();
          }
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isImageLoading.value = false;
  }

  void getProductReview() async {
    isReviewLoading.value = true;

    var data = PageSizeRequest(id: id.value, page: 1, size: 3);

    final response = await getProductReviewUseCase(data);

    safeCallApi<ProductReviewResponse>(response,
        onLoad: (status) => isLoading.value = status,
        onSuccess: (response) {
          if (response != null) {
            reviewList.value = response.items ?? <ReviewItem>[];
          }
        },
        onError: (code, message) {
          commonDialog.showCommonDialog(message);
        });

    isReviewLoading.value = false;
  }

  // Add Cart
  Future<void> addCart() async {
    final response = await postAddCartUseCase({
      'itemId': productDetailId(),
      'qty': minOrder(),
    });
    safeCallApi<AddCartResponseData>(response, onSuccess: (response) {
      Get.rawSnackbar(message: response?.remark ?? "Success");
      Get.find<HomeController>().getCartCount();
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  // Checkout Cart
  Future<void> checkoutCart() async {
    var data = {
      'items': [
        {
          'product_detail_id': productDetailId(),
          'quantity': minOrder(),
        },
      ]
    };
    final response = await postCheckoutUseCase(data);
    safeCallApi<CheckoutResponseData>(response, onSuccess: (response) {
      Get.toNamed(RouteName.directBuy);
    }, onError: (code, message) {
      showCommonDialog(message);
    });
  }

  void share(String url) {
    Share.share(url, subject: url);
  }

  void onBackPressed() {
    Get.back(result: true);
  }
}
