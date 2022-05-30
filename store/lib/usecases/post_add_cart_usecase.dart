import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:store/data/add_cart_response.dart';
import 'package:store/repository/merchant_repository.dart';

class PostAddCartUseCase
    extends UseCase<BaseResult<AddCartResponseData>, Map<String, dynamic>> {
  PostAddCartUseCase(this.repository);
  final MerchantRepository repository;

  @override
  Future<BaseResult<AddCartResponseData>> call(
      Map<String, dynamic> params) async {
    return await repository.addCart(
      params['itemId'],
      params['qty'],
    );
  }
}
