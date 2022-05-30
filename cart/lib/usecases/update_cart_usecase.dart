import 'package:cart/data/remote/add_cart_response.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class UpdateCartUseCase
    extends UseCase<BaseResult<AddCartResponseData>, Map<String, dynamic>> {
  UpdateCartUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<AddCartResponseData>> call(
      Map<String, dynamic> params) async {
    return await repository.addCart(params['itemId'], params['qty']);
  }
}
