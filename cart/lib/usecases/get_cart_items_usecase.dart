import 'package:cart/data/remote/cart_item_model.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class GetCartItemsUseCase
    extends UseCase<BaseResult<List<CartItemModelData>>, NoParams> {
  GetCartItemsUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<List<CartItemModelData>>> call(NoParams params) async {
    return await repository.getCartItems();
  }
}
