import 'package:core/core.dart';
import 'package:storefront/data/request/create_wishlist_response.dart';
import 'package:storefront/data/request/delete_wishlist_response.dart';
import 'package:storefront/data/request/merchant_detail_response.dart';
import 'package:storefront/data/request/merchant_product_response.dart';
import 'package:storefront/data/request/merchant_review_response.dart';
import 'package:storefront/data/request/merchant_workhour_response.dart';
import 'package:storefront/data/request/quotation_list_response.dart';
import 'package:storefront/datasource/storefront_remote_data_source.dart';

abstract class StorefrontRepository {
  Future<BaseResult<QuotationListResponse>> getQuotationList(
      int merchantId, int page);
  Future<BaseResult<MerchantProductResponse>> getMerchantProduct(
      int merchantId, int page);
  Future<BaseResult<MerchantReviewResponse>> getMerchantReview(
      int merchantId, int page);

  Future<BaseResult<MerchantDetailResponse>> getMerchantDetail(int merchantId);
  Future<BaseResult<String>> getMerchantRating(int merchantId);
  Future<BaseResult<MerchantWorkHourResponse>> getMerchantWorkhour(
      int merchantId);
  Future<BaseResult<CreateWishlistResponse>> createWishlist(int productId);
  Future<BaseResult<DeleteWishlistResponse>> deleteWishlist(
      int productDetailId);
}

class StorefrontRepositoryImpl extends StorefrontRepository {
  StorefrontRepositoryImpl(this.getStorefrontRemoteDataSource);
  final StorefrontRemoteDataSource getStorefrontRemoteDataSource;

  @override
  Future<BaseResult<QuotationListResponse>> getQuotationList(
      int merchantId, int page) async {
    return await getStorefrontRemoteDataSource.getQuotationList(
        merchantId, page);
  }

  @override
  Future<BaseResult<MerchantDetailResponse>> getMerchantDetail(
      int merchantId) async {
    return await getStorefrontRemoteDataSource.getMerchantDetail(merchantId);
  }

  @override
  Future<BaseResult<String>> getMerchantRating(int merchantId) async {
    return await getStorefrontRemoteDataSource.getMerchantInfo(merchantId);
  }

  @override
  Future<BaseResult<MerchantWorkHourResponse>> getMerchantWorkhour(
      int merchantId) async {
    return await getStorefrontRemoteDataSource.getMerchantWorkHour(merchantId);
  }

  @override
  Future<BaseResult<MerchantProductResponse>> getMerchantProduct(
      int merchantId, int page) async {
    return await getStorefrontRemoteDataSource.getMerchantProduct(
        merchantId, page);
  }

  @override
  Future<BaseResult<CreateWishlistResponse>> createWishlist(
      int productId) async {
    return await getStorefrontRemoteDataSource.createWishlist(productId);
  }

  @override
  Future<BaseResult<DeleteWishlistResponse>> deleteWishlist(
      int productDetailId) async {
    return await getStorefrontRemoteDataSource.deleteWishlist(productDetailId);
  }

  @override
  Future<BaseResult<MerchantReviewResponse>> getMerchantReview(int merchantId, int page)async {
    return await getStorefrontRemoteDataSource.getMerchantReview(
        merchantId, page);
  }
}
