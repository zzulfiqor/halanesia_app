import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/repository/merchant_repository.dart';
import 'package:core/entity/empty_response.dart';

class UpdateProductStockUseCase
    extends UseCase<BaseResult, Map<String, dynamic>> {
  UpdateProductStockUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<EmptyResponse>> call(params) async {
    return await repository.updateStock(params['productId'], params['stock']);
  }
}
