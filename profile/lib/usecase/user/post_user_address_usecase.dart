import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/profile.dart';

import '../../data/request/user_address_request.dart';
import '../../data/response/user_address_data.dart';

class PostUserAddressUseCase
    extends UseCase<BaseResult<UserAddressResponse>, UserAddressRequest> {
  PostUserAddressUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<UserAddressResponse>> call(UserAddressRequest params) async{
   return await repository.postUserAddress(params);
  }
}
