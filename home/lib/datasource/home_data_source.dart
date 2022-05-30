import 'package:core/base/base_data_source.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/constants.dart';
import 'package:home/data/remote/banner_entity.dart';
import 'package:home/data/remote/cart_item_model.dart';
import 'package:home/data/remote/create_wishlist_response.dart';
import 'package:home/data/remote/delete_wishlist_response.dart';
import 'package:home/data/remote/quotation_list_response.dart';
import 'package:home/data/remote/recent_product_response.dart';
import 'package:home/data/remote/recomendation_item_reponse.dart';

class HomeDataSource extends BaseDataSource {
  HomeDataSource({required this.apiProvider});

  final ApiProvider apiProvider;

   // Get Cart Items
  Future<BaseResult<List<CartItemModelData>>> getCartItem() async {
    return getResult(
        apiProvider.get(URL_CART),
        (response) => response['data']
            .map<CartItemModelData>((e) => CartItemModelData.fromJson(e))
            .toList());
  }

  Future<BaseResult<List<BannerEntity>>> getBanner(
      {int limit = 2, int page = 1}) async {
    return getResult(
        apiProvider.get('$URL_PROMO_BANNER?limit=$limit&page=$page'),
        (response) => response['data']
            .map<BannerEntity>((e) => BannerEntity.fromJson(e))
            .toList());
  }

  Future<BaseResult<QuotationListResponse>> getQuotationList(int? page) async {
    return getResult(apiProvider.get('$URL_QUOTATION?size=6&page=1'),
        (response) => QuotationListResponse.fromJson(response['data']));
  }

  Future<BaseResult<RecentProductResponse>> getRecentProduct(
      {int limit = 5, int page = 1}) async {
    return getResult(
        apiProvider.get('$URL_RECENT_PRODUCT?size=$limit&page=$page'),
        (response) => RecentProductResponse.fromJson(response['data']));
  }

  Future<BaseResult<RecomendationResponse>> getRecomendationBuyer(
      int? page) async {
    return getResult(apiProvider.get('$URL_RECOMENDATION_BUYER?page=$page'),
        (response) => RecomendationResponse.fromJson(response['data']));
  }

  Future<BaseResult<RecomendationResponse>> getRecomendationSupplier(
      int? page) async {
    return getResult(apiProvider.get('$URL_RECOMENDATION_SUPPLIER?page=$page'),
        (response) => RecomendationResponse.fromJson(response['data']));
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
