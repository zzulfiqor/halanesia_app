import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/request/merchant_edit_request.dart';
import 'package:profile/data/response/merchant_response.dart';
import 'package:profile/profile.dart';

class PutMerchantUseCase
    extends UseCase<BaseResult<MerchantResponse>, MerchantEditRequest> {
  PutMerchantUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantResponse>> call(MerchantEditRequest params) async{
   return await repository.putMerchant(params);
  }
}
