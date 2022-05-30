import 'package:core/entity/result.dart';
import 'package:home/data/remote/banner_entity.dart';
import 'package:home/data/remote/cart_item_model.dart';
import 'package:home/data/remote/create_wishlist_response.dart';
import 'package:home/data/remote/delete_wishlist_response.dart';
import 'package:home/data/remote/quotation_list_response.dart';
import 'package:home/data/remote/recent_product_response.dart';
import 'package:home/data/remote/recomendation_item_reponse.dart';
import 'package:home/datasource/home_data_source.dart';

abstract class HomeRepository {
  Future<BaseResult<List<CartItemModelData>>> getCartItem();
  Future<BaseResult<List<BannerEntity>>> getBanner({int limit, int page});
  Future<BaseResult<QuotationListResponse>> getQuotationList(int page);
  Future<BaseResult<RecomendationResponse>> getRecomendationBuyer(int page);
  Future<BaseResult<RecomendationResponse>> getRecomendationSupplier(int page);
  Future<BaseResult<RecentProductResponse>> getRecentProduct(int page);
  Future<BaseResult<CreateWishlistResponse>> createWishlist(int productId);
   Future<BaseResult<DeleteWishlistResponse>> deleteWishlist(int productDetailId);
} 


class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.getHomeDataSource);

  final HomeDataSource getHomeDataSource;



  @override
  Future<BaseResult<List<BannerEntity>>> getBanner(
      {int limit = 2, int page = 1}) async {
    return await getHomeDataSource.getBanner();
  }

  @override
  Future<BaseResult<QuotationListResponse>> getQuotationList(int page) async {
    return await getHomeDataSource.getQuotationList(page);
  }

  @override
  Future<BaseResult<RecomendationResponse>> getRecomendationBuyer(
      int page) async {
    return await getHomeDataSource.getRecomendationBuyer(page);
  }

  @override
  Future<BaseResult<RecomendationResponse>> getRecomendationSupplier(
      int page) async {
    return await getHomeDataSource.getRecomendationSupplier(page);
  }

  @override
  Future<BaseResult<RecentProductResponse>> getRecentProduct(int page) async {
    return await getHomeDataSource.getRecentProduct(page: page);
  }

  @override
  Future<BaseResult<CreateWishlistResponse>> createWishlist(
      int productId) async {
    return await getHomeDataSource.createWishlist(productId);
  }

  @override
  Future<BaseResult<DeleteWishlistResponse>> deleteWishlist(int productDetailId) async{
    return await getHomeDataSource.deleteWishlist(productDetailId);
  }

  @override
  Future<BaseResult<List<CartItemModelData>>> getCartItem()async{
    return await getHomeDataSource.getCartItem();
  }
}
