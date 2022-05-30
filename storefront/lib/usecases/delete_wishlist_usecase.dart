

import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:storefront/data/request/delete_wishlist_response.dart';
import 'package:storefront/repository/storefront_repository.dart';

class DeleteMerchantWishlistUseCase
    extends UseCase<BaseResult<DeleteWishlistResponse>, int> {
  DeleteMerchantWishlistUseCase(this.repository);

  final StorefrontRepository repository;

  @override
  Future<BaseResult<DeleteWishlistResponse>> call(int params) async {
    return await repository.deleteWishlist(params);
  }
}
