import 'dart:io';

import 'package:core/core.dart';
import 'package:core/data/remote/usecase.dart';
import 'package:profile/profile.dart';
import 'package:profile/data/response/user_info_response.dart';

class PutUserImageProfileUseCase
    extends UseCase<BaseResult<UserInfoResponse>, String> {
  PutUserImageProfileUseCase(this.repository);

  final ProfileRepository repository;

  @override
  Future<BaseResult<UserInfoResponse>> call(String image) async{
   return await repository.putUserImageProfile(image);
  }
}
