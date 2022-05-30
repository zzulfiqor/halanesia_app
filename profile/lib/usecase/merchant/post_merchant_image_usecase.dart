import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/merchant_response.dart';
import 'package:profile/repository/profile_repository.dart';

class PostMerchantImageUseCase
    extends UseCase<BaseResult<MerchantResponse>, String> {
  PostMerchantImageUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantResponse>> call(String params) async{
   return await repository.postMerchantImage(params);
  }
}
