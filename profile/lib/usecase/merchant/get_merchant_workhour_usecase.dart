import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/merchant_workhour_response.dart';
import 'package:profile/repository/profile_repository.dart';

class GetMerchantWorkhourUseCase
    extends UseCaseNoParams<BaseResult<MerchantWorkhourResponse>> {
  GetMerchantWorkhourUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantWorkhourResponse>> call() async{
   return await repository.getMerchantWorkhour();
  }
}
