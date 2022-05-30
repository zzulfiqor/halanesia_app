import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/request/merchant_bank_request.dart';
import 'package:profile/data/response/merchant_bank_response.dart';
import 'package:profile/repository/profile_repository.dart';


class PostMerchantBankUseCase
    extends UseCase<BaseResult<MerchantBankResponse>, MerchantBankRequest> {
  PostMerchantBankUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantBankResponse>> call(MerchantBankRequest params) async{
   return await repository.posMerchantBank(params);
  }
}
