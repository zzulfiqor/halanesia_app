import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/request/merchant_workhour_request.dart';
import 'package:profile/data/response/merchant_workhour_update_response.dart';
import 'package:profile/profile.dart';

class PutMerchantWorkhourUseCase
    extends UseCase<BaseResult<MerchantWorkhourUpdateResponse>, MerchantWorkhourRequest> {
  PutMerchantWorkhourUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<MerchantWorkhourUpdateResponse>> call(MerchantWorkhourRequest params) async{
   return await repository.putMerchantWorkhour(params);
  }
}
