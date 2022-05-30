import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/user_address_data.dart';
import 'package:profile/repository/profile_repository.dart';

class GetUserListAddressUseCase
    extends UseCaseNoParams<BaseResult<List<UserAddressResponse>>> {
  GetUserListAddressUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<List<UserAddressResponse>>> call() async{
   return await repository.getUserListAddress();
  }
}
