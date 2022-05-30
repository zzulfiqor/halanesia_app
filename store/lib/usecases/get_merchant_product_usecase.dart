import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/data/merchant_product_response.dart';
import 'package:store/repository/merchant_repository.dart';

class GetMerchantProductUseCase
    extends UseCase<BaseResult<MerchantProductResponse>, int> {
  GetMerchantProductUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<MerchantProductResponse>> call(int params) async {
    return await repository.getMerchantProduct(params);
  }
}
