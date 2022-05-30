import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/data/response/user_info_response.dart';
import 'package:profile/repository/profile_repository.dart';

class GetUserInfoUseCase
    extends UseCaseNoParams<BaseResult<UserInfoResponse>> {
  GetUserInfoUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<UserInfoResponse>> call() async{
   return await repository.getUserInfo();
  }
}
