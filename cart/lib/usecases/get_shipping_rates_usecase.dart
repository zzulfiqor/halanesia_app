import 'package:cart/data/remote/shipping_rates_reponse.dart';
import 'package:cart/repository/cart_repository.dart';
import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';

class GetShippingRatesUseCase
    extends UseCase<BaseResult<ShippingRatesResponseData>, NoParams> {
  GetShippingRatesUseCase(this.repository);
  final CartRepository repository;

  @override
  Future<BaseResult<ShippingRatesResponseData>> call(NoParams params) async {
    return await repository.getCourier();
  }
}
