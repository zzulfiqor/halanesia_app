import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:home/data/remote/delete_wishlist_response.dart';
import 'package:home/repository/home_repository.dart';

class DeleteWishlistUseCase
    extends UseCase<BaseResult<DeleteWishlistResponse>, int> {
  DeleteWishlistUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<BaseResult<DeleteWishlistResponse>> call(int params) async {
    return await repository.deleteWishlist(params);
  }
}
