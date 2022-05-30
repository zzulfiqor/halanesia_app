import 'package:cart/data/remote/add_cart_response.dart';
import 'package:cart/data/remote/delete_cart_response.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class DeleteCartUseCase
    extends UseCase<BaseResult<DeleteCartResponseData>, List<int>> {
  DeleteCartUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<DeleteCartResponseData>> call(
     List<int> params) async {
    return await repository.deleteCart(params);
  }
}
