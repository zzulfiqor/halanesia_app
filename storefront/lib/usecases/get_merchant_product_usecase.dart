import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:storefront/data/request/merchant_product_response.dart';
import 'package:storefront/repository/storefront_repository.dart';

class GetMerchantProductUseCase
    extends UseCase<BaseResult<MerchantProductResponse>, Map<String, int>> {
  GetMerchantProductUseCase(this.repository);

  final StorefrontRepository repository;

  @override
  Future<BaseResult<MerchantProductResponse>> call(
      Map<String, int> params) async {
    return await repository.getMerchantProduct(params['merchantId'] as int, params['page'] as int);
  }
}
