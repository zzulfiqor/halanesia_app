import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/result.dart';
import 'package:store/data/add_product_request.dart';
import 'package:store/data/add_product_response.dart';
import 'package:store/repository/merchant_repository.dart';

class PutMerchantProductUseCase
    extends UseCase<BaseResult<AddProductResponse>, AddProductRequest> {
  PutMerchantProductUseCase(this.repository);

  final MerchantRepository repository;

  @override
  Future<BaseResult<AddProductResponse>> call(params) async {
    return await repository.putMerchantProduct(params);
  }
}
