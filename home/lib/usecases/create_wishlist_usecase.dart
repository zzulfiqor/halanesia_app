import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:home/data/remote/create_wishlist_response.dart';
import 'package:home/repository/home_repository.dart';

class CreateWishlistUsecase
    extends UseCase<BaseResult<CreateWishlistResponse>, int> {
  CreateWishlistUsecase(this.repository);

  final HomeRepository repository;

  @override
  Future<BaseResult<CreateWishlistResponse>> call(int params) async {
    return await repository.createWishlist(params);
  }
}
