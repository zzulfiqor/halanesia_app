import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:storefront/data/request/merchant_workhour_response.dart';
import 'package:storefront/repository/storefront_repository.dart';

class GetMerchantWorkhourUseCase
    extends UseCase<BaseResult<MerchantWorkHourResponse>, int> {
  GetMerchantWorkhourUseCase(this.repository);

  final StorefrontRepository repository;

  @override
  Future<BaseResult<MerchantWorkHourResponse>> call(int params) async {
    return await repository.getMerchantWorkhour(params);
  }
}