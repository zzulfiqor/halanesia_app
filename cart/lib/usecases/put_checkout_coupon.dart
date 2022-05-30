import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class PutCheckoutCouponUsecase
    extends UseCase<BaseResult<CheckoutResponseData>, int> {
  PutCheckoutCouponUsecase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<CheckoutResponseData>> call(int params) async {
    return await repository.updateCoupon(params);
  }
}
