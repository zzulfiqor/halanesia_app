import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/data/product_category_response.dart';
import 'package:store/repository/merchant_repository.dart';

class GetProductCategoryUseCase
    extends UseCase<BaseResult<List<ProductCategoryResponse>>, NoParams> {
  GetProductCategoryUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<List<ProductCategoryResponse>>> call(
      NoParams params) async {
    return await repository.getProductCategory();
  }
}
