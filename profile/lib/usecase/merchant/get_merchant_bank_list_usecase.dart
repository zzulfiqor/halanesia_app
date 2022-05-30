import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/merchant_bank_data_response.dart';
import 'package:profile/repository/profile_repository.dart';

class GetMerchantBankListUseCase
    extends UseCaseNoParams<BaseResult<List<MerchantBankDataResponse>>> {
  GetMerchantBankListUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<List<MerchantBankDataResponse>>> call() async{
   return await repository.getMerchantBankList();
  }
}
