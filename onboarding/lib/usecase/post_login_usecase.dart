import 'package:core/data/remote/usecase.dart';
import 'package:onboarding/repository/onboarding_repository.dart';
import 'package:core/entity/login_response.dart';
import 'package:core/entity/result.dart';
import 'package:core/entity/login_request.dart';

class PostLoginUseCase
    extends UseCase<BaseResult<LoginResponse>, LoginRequest> {
  PostLoginUseCase(this.repository);

  final OnBoardingRepository repository;

  @override
  Future<BaseResult<LoginResponse>> call(LoginRequest params) async {
    return await repository.postLogin(params);
  }
}
