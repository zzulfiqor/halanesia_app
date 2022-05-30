import 'package:core/base/base_data_source.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/constants.dart';
import 'package:store/data/add_cart_response.dart';
import 'package:store/data/add_product_request.dart';
import 'package:store/data/add_product_response.dart';
import 'package:store/data/checkout_request.dart.dart';
import 'package:store/data/merchant_product_response.dart';
import 'package:store/data/page_size_request.dart';
import 'package:store/data/product_category_response.dart';
import 'package:core/entity/image_upload_response.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:core/entity/empty_response.dart';
import 'package:store/data/product_detail_response.dart';
import 'package:store/data/product_related_request.dart';
import 'package:store/data/product_related_response.dart';
import 'package:store/data/product_review_image_response.dart';
import 'package:store/data/product_review_response.dart';

class MerchantDataSource extends BaseDataSource {
  MerchantDataSource({required this.api});

  final ApiProvider api;

  Future<BaseResult<MerchantProductResponse>> getMerchantProduct(
      int page) async {
    return getResult(api.get('product?page=$page'),
        (response) => MerchantProductResponse.fromJson(response['data']));
  }

  Future<BaseResult<AddProductResponse>> putMerchantProduct(
      AddProductRequest request, int? id) async {
    var url = '';
    if (id != null) {
      url = 'product/$id';
    } else {
      url = 'product';
    }
    return getResult(api.put(url, request.toJson()),
        (response) => AddProductResponse.fromJson(response['data']));
  }

  Future<BaseResult<List<ProductCategoryResponse>>> getProductCategory() async {
    return getResult(
        api.get('product/categories'),
        (response) => response['data']
            .map<ProductCategoryResponse>(
                (e) => ProductCategoryResponse.fromJson(e))
            .toList());
  }

  Future<BaseResult<ImageUploadResponse>> postMerchantImage(
      String image) async {
    var formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(image,
          filename: image.split('/').last,
          contentType: MediaType("image", "jpeg")),
    });
    return getResult(api.postFormData('product/image', formData),
        (response) => ImageUploadResponse.fromJson(response['data']));
  }

  Future<BaseResult<EmptyResponse>> updateStock(
      int productId, int stock) async {
    return getResultWithEmptyResponse(
        api.update('product/$productId/stock', {'stock': stock}));
  }

  Future<BaseResult<EmptyResponse>> updatePrice(
      int productId, int price) async {
    return getResultWithEmptyResponse(
        api.update('product/$productId/price', {'price': price}));
  }

  Future<BaseResult<ProductDetailResponse>> getProductDetail(int id) async {
    return getResult(api.get('product/$id'),
        (response) => ProductDetailResponse.fromJson(response['data']));
  }

  Future<BaseResult<ProductReviewResponse>> getProductReview(
      PageSizeRequest data) async {
    return getResult(
        api.get(
            'product/${data.id}/review?size=${data.size}&page=${data.page}'),
        (response) => ProductReviewResponse.fromJson(response['data']));
  }

  Future<BaseResult<ProductRelatedResponse>> getProductRelated(
      ProductRelatedRequest data) async {
    return getResult(
        api.get(
            'product/related?category_id=${data.categoryId}&page=${data.page}&size=${data.size}&merchant_id=${data.merchantId}'),
        (response) => ProductRelatedResponse.fromJson(response['data']));
  }

  Future<BaseResult<ProductReviewImageResponse>> getProductReviewImage(
      PageSizeRequest data) async {
    return getResult(
        api.get(
            'product/${data.id}/review/image?size=${data.size}&page=${data.page}'),
        (response) => ProductReviewImageResponse.fromJson(response['data']));
  }

  // Add/Update Cart
  Future<BaseResult<AddCartResponseData>> addCart(int itemId, int qty) async {
    return getResult(
        api.post(URL_CART, {'product_detail_id': itemId, 'quantity': qty}),
        (response) => AddCartResponseData.fromJson(response['data']));
  }

  // checkout
  Future<BaseResult<CheckoutResponseData>> checkoutItem(
      List<Map> items, int couponId) async {
    return getResult(api.post(URL_CHECKOUT, {'items': items}),
        (response) => CheckoutResponseData.fromJson(response['data']));
  }
}
