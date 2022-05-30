import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/profile.dart';
import 'package:profile/data/request/user_address_request.dart';
import 'package:profile/data/response/user_address_data.dart';

class PutUserAddressUseCase
    extends UseCaseParamsId<BaseResult<UserAddressResponse>, UserAddressRequest, int> {
  PutUserAddressUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<UserAddressResponse>> call(UserAddressRequest params, int id) async{
   return await repository.putUserAddress(params, id);
  }
}
