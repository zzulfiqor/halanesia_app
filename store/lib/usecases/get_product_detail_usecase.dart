import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/data/product_detail_response.dart';
import 'package:store/repository/merchant_repository.dart';

class GetProductDetailUseCase
    extends UseCase<BaseResult<ProductDetailResponse>, int> {
  GetProductDetailUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<ProductDetailResponse>> call(int params) async {
    return await repository.getProductDetail(params);
  }
}
