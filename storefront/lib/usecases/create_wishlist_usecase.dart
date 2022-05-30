

import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:storefront/data/request/create_wishlist_response.dart';
import 'package:storefront/repository/storefront_repository.dart';

class CreateMerchantWishlistUsecase
    extends UseCase<BaseResult<CreateWishlistResponse>, int> {
  CreateMerchantWishlistUsecase(this.repository);

  final StorefrontRepository repository;

  @override
  Future<BaseResult<CreateWishlistResponse>> call(int params) async {
    return await repository.createWishlist(params);
  }
}
