import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/merchant_type_response.dart';
import 'package:profile/repository/profile_repository.dart';

class GetMerchantTypeUseCase
    extends UseCaseNoParams<BaseResult<List<MerchantTypeResponse>>> {
  GetMerchantTypeUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<List<MerchantTypeResponse>>> call() async{
   return await repository.getMerchantType();
  }
}
