import 'package:cart/data/remote/wishlist_response_model.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class GetWishlistItemsCartUseCase
    extends UseCase<BaseResult<WishlistResponseData>, Map<String, dynamic>> {
  GetWishlistItemsCartUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<WishlistResponseData>> call(
      Map<String, dynamic> params) async {
    return await repository.getWishlistItems(
        page: params['page'],
        size: params['size'],
        order: params['order'],
        sort: params['sort']);
  }
}
