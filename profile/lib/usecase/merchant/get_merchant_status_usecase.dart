import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/merchant_status_response.dart';
import 'package:profile/repository/profile_repository.dart';

class GetMerchantStatusUseCase
    extends UseCaseNoParams<BaseResult<MerchantStatusResponse>> {
  GetMerchantStatusUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantStatusResponse>> call() async{
   return await repository.getMerchantStatus();
  }
}
