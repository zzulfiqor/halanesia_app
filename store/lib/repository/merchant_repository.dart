import 'package:core/entity/result.dart';
import 'package:store/data/add_cart_response.dart';
import 'package:store/data/add_product_request.dart';
import 'package:store/data/add_product_response.dart';
import 'package:store/data/checkout_request.dart.dart';
import 'package:store/data/merchant_product_response.dart';
import 'package:store/data/page_size_request.dart';
import 'package:store/data/product_category_response.dart';
import 'package:store/data/product_detail_response.dart';
import 'package:store/data/product_related_request.dart';
import 'package:store/data/product_related_response.dart';
import 'package:store/data/product_review_image_response.dart';
import 'package:store/data/product_review_response.dart';
import 'package:store/datasource/merchant_data_source.dart';
import 'package:core/entity/image_upload_response.dart';
import 'package:core/entity/empty_response.dart';

abstract class MerchantRepository {
  Future<BaseResult<MerchantProductResponse>> getMerchantProduct(int page);

  Future<BaseResult<List<ProductCategoryResponse>>> getProductCategory();

  Future<BaseResult<AddProductResponse>> putMerchantProduct(
      AddProductRequest request);

  Future<BaseResult<ImageUploadResponse>> postMerchantImage(String image);

  Future<BaseResult<EmptyResponse>> updateStock(int productId, int stock);

  Future<BaseResult<EmptyResponse>> updatePrice(int productId, int price);

  Future<BaseResult<ProductDetailResponse>> getProductDetail(int id);

  Future<BaseResult<ProductReviewResponse>> getProductReview(
      PageSizeRequest data);

  Future<BaseResult<ProductRelatedResponse>> getProductRelated(
      ProductRelatedRequest data);

  Future<BaseResult<ProductReviewImageResponse>> getProductReviewImage(
      PageSizeRequest data);

  Future<BaseResult<AddCartResponseData>> addCart(int productId, int quantity);

  // checkout item
  Future<BaseResult<CheckoutResponseData>> checkoutItem(
      List<Map> items, int couponId);
}

class MerchantRepositoryImpl implements MerchantRepository {
  MerchantRepositoryImpl(this.getMerchantDataSource);

  final MerchantDataSource getMerchantDataSource;

  @override
  Future<BaseResult<MerchantProductResponse>> getMerchantProduct(
      int page) async {
    return await getMerchantDataSource.getMerchantProduct(page);
  }

  @override
  Future<BaseResult<List<ProductCategoryResponse>>> getProductCategory() async {
    return await getMerchantDataSource.getProductCategory();
  }

  @override
  Future<BaseResult<AddProductResponse>> putMerchantProduct(
      AddProductRequest request) async {
    return await getMerchantDataSource.putMerchantProduct(request, request.id);
  }

  @override
  Future<BaseResult<ImageUploadResponse>> postMerchantImage(
      String image) async {
    return await getMerchantDataSource.postMerchantImage(image);
  }

  @override
  Future<BaseResult<EmptyResponse>> updatePrice(
      int productId, int price) async {
    return await getMerchantDataSource.updatePrice(productId, price);
  }

  @override
  Future<BaseResult<EmptyResponse>> updateStock(
      int productId, int stock) async {
    return await getMerchantDataSource.updateStock(productId, stock);
  }

  @override
  Future<BaseResult<ProductDetailResponse>> getProductDetail(int id) async {
    return await getMerchantDataSource.getProductDetail(id);
  }

  @override
  Future<BaseResult<ProductReviewResponse>> getProductReview(
      PageSizeRequest data) async {
    return await getMerchantDataSource.getProductReview(data);
  }

  @override
  Future<BaseResult<ProductRelatedResponse>> getProductRelated(
      ProductRelatedRequest data) async {
    return await getMerchantDataSource.getProductRelated(data);
  }

  @override
  Future<BaseResult<ProductReviewImageResponse>> getProductReviewImage(
      PageSizeRequest data) async {
    return await getMerchantDataSource.getProductReviewImage(data);
  }

  @override
  Future<BaseResult<CheckoutResponseData>> checkoutItem(
      List<Map> items, int? couponId) async {
    return await getMerchantDataSource.checkoutItem(items, couponId!);
  }

  @override
  Future<BaseResult<AddCartResponseData>> addCart(int itemId, int qty) async {
    return await getMerchantDataSource.addCart(itemId, qty);
  }
}
