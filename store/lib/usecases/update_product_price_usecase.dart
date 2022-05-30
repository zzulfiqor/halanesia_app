import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/repository/merchant_repository.dart';
import 'package:core/entity/empty_response.dart';
class UpdateProductPriceUseCase
    extends UseCase<BaseResult, Map<String, dynamic>> {
  UpdateProductPriceUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<EmptyResponse>> call(params) async {
    return await repository.updatePrice(params['productId'], params['price']);
  }
}
