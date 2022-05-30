import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/profile.dart';
import 'package:profile/data/request/user_info_request.dart';
import 'package:profile/data/response/user_info_response.dart';

class PutUserProfileUseCase
    extends UseCase<BaseResult<UserInfoResponse>, UserInfoRequest> {
  PutUserProfileUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<UserInfoResponse>> call(UserInfoRequest params) async{
   return await repository.putUserProfile(params);
  }
}
