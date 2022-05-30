import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class CheckoutCartUseCase
    extends UseCase<BaseResult<CheckoutResponseData>, Map> {
  CheckoutCartUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<CheckoutResponseData>> call(Map params) async {
    return await repository.checkoutItem(
      params['items'],
      params['coupon_id'] ?? 0,
    );
  }
}
