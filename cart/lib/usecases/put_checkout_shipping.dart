import 'package:cart/data/remote/add_cart_response.dart';
import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class PutCheckoutShippingUseCase
    extends UseCase<BaseResult<CheckoutResponseData>, int> {
  PutCheckoutShippingUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<CheckoutResponseData>> call(int params) async {
    return await repository.updateShipping(params);
  }
}
