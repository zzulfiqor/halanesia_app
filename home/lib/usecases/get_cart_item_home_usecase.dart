import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:home/data/remote/cart_item_model.dart';
import 'package:home/repository/home_repository.dart';

class GetCartItemHomeUseCase
    extends UseCase<BaseResult<List<CartItemModelData>>, NoParams> {
  GetCartItemHomeUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<BaseResult<List<CartItemModelData>>> call(NoParams params) async {
    return await repository.getCartItem();
  }
}
