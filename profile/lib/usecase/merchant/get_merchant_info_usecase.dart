import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/merchant_info_response.dart';
import 'package:profile/repository/profile_repository.dart';

class GetMerchantInfoUseCase
    extends UseCaseNoParams<BaseResult<MerchantInfoResponse>> {
  GetMerchantInfoUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantInfoResponse>> call() async{
   return await repository.getMerchantInfo();
  }
}
