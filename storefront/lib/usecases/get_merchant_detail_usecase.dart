import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:storefront/data/request/merchant_detail_response.dart';
import 'package:storefront/repository/storefront_repository.dart';

class GetMerchantDetailUseCase
    extends UseCase<BaseResult<MerchantDetailResponse>, int> {
  GetMerchantDetailUseCase(this.repository);

  final StorefrontRepository repository;

  @override
  Future<BaseResult<MerchantDetailResponse>> call(int params) async {
    return await repository.getMerchantDetail(params);
  }
}