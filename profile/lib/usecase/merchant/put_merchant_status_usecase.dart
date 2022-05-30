import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/request/merchant_status_request.dart';
import 'package:profile/data/response/merchant_status_response.dart';
import 'package:profile/profile.dart';

class PutMerchantStatusUseCase
    extends UseCase<BaseResult<MerchantStatusResponse>, MerchantStatusRequest> {
  PutMerchantStatusUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantStatusResponse>> call(MerchantStatusRequest params) async{
   return await repository.putMerchantStatus(params);
  }
}
