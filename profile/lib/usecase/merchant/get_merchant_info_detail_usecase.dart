import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/merchant_info_detail_response.dart';
import 'package:profile/repository/profile_repository.dart';


class GetMerchantInfoDetailUseCase
    extends UseCaseNoParams<BaseResult<MerchantInfoDetailResponse>> {
  GetMerchantInfoDetailUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantInfoDetailResponse>> call() async{
   return await repository.getMerchantInfoDetail();
  }
}
