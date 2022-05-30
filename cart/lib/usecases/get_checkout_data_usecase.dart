import 'package:cart/data/remote/checkout_response.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class GetCheckoutDataUseCase
    extends UseCase<BaseResult<CheckoutResponseData>, NoParams> {
  GetCheckoutDataUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<CheckoutResponseData>> call(NoParams params) async {
    return await repository.getCheckoutData();
  }
}
