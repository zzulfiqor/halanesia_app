import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/request/merchant_profile_request.dart';
import 'package:profile/data/response/merchant_response.dart';
import 'package:profile/repository/profile_repository.dart';


class PostMerchantRegisterUseCase
    extends UseCase<BaseResult<MerchantResponse>, MerchantProfileRequest> {
  PostMerchantRegisterUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantResponse>> call(MerchantProfileRequest params) async{
   return await repository.postMerchantRegister(params);
  }
}
