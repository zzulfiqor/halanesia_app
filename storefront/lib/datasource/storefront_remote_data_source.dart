import 'package:core/core.dart';
import 'package:core/data/remote/constants.dart';
import 'package:storefront/data/request/create_wishlist_response.dart';
import 'package:storefront/data/request/delete_wishlist_response.dart';
import 'package:storefront/data/request/merchant_detail_response.dart';
import 'package:storefront/data/request/merchant_product_response.dart';
import 'package:storefront/data/request/merchant_review_response.dart';
import 'package:storefront/data/request/merchant_workhour_response.dart';
import 'package:storefront/data/request/quotation_list_response.dart';
import 'package:core/base/base_data_source.dart';

class StorefrontRemoteDataSource extends BaseDataSource {
  StorefrontRemoteDataSource({required this.apiProvider});

  final ApiProvider apiProvider;

  // merchant detail
  Future<BaseResult<MerchantDetailResponse>> getMerchantDetail(
      int merchantId) async {
    return getResult(apiProvider.get(URL_MERCHANT + "/$merchantId/detail"),
        (response) => MerchantDetailResponse.fromJson(response['data']));
  }

  Future<BaseResult<MerchantWorkHourResponse>> getMerchantWorkHour(
      int merchantId) async {
    return getResult(apiProvider.get(URL_MERCHANT + "/$merchantId/workhour"),
        (response) => MerchantWorkHourResponse.fromJson(response['data']));
  }

  Future<BaseResult<String>> getMerchantInfo(int merchantId) async {
    return getResult(apiProvider.get(URL_MERCHANT + "/$merchantId/rating"),
        (response) => response['data'].toString());
  }

  // Merchant Product
  Future<BaseResult<MerchantProductResponse>> getMerchantProduct(int? merchantId,int? page) async {
    return getResult(apiProvider.get(URL_MERCHANT +'/$merchantId/product'+ '?page=$page&size=6'),
        (response) => MerchantProductResponse.fromJson(response['data']));
  }

  // Merchant QUOTATION
  Future<BaseResult<QuotationListResponse>> getQuotationList(int? merchantId,int? page) async {
    return getResult(apiProvider.get(URL_MERCHANT +'/$merchantId/quotation'+ '?page=$page'),
        (response) => QuotationListResponse.fromJson(response['data']));
  }

   // Merchant Review
  Future<BaseResult<MerchantReviewResponse>> getMerchantReview(int? merchantId,int? page) async {
    return getResult(apiProvider.get(URL_MERCHANT +'/$merchantId/review'+ '?page=$page&size=5'),
        (response) => MerchantReviewResponse.fromJson(response['data']));
  }

  Future<BaseResult<CreateWishlistResponse>> createWishlist(
      int productId) async {
    return getResult(
        apiProvider.post(URL_CREATE_WISHLIST, {'product_detail_id': productId}),
        (response) => CreateWishlistResponse.fromJson(response['data']));
  }

  Future<BaseResult<DeleteWishlistResponse>> deleteWishlist(
      int productId) async {
    return getResult(
        apiProvider.delete(URL_CREATE_WISHLIST + '/$productId', {}),
        (response) => DeleteWishlistResponse.fromJson(response['data']));
  }
}
