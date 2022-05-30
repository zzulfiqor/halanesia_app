import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/data/product_related_request.dart';
import 'package:store/data/product_related_response.dart';
import 'package:store/repository/merchant_repository.dart';

class GetProductRelatedUseCase
    extends UseCase<BaseResult<ProductRelatedResponse>, ProductRelatedRequest> {
  GetProductRelatedUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<ProductRelatedResponse>> call(ProductRelatedRequest params) async {
    return await repository.getProductRelated(params);
  }
}
