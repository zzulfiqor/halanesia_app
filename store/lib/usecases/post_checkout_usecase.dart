import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:store/data/checkout_request.dart.dart';
import 'package:store/repository/merchant_repository.dart';

class PostCheckoutUseCase
    extends UseCase<BaseResult<CheckoutResponseData>, Map> {
  PostCheckoutUseCase(this.repository);
  final MerchantRepository repository;

  @override
  Future<BaseResult<CheckoutResponseData>> call(Map params) async {
    return await repository.checkoutItem(
      params['items'],
      params['coupon_id'] ?? 0,
    );
  }
}
