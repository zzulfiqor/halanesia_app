import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/register_response.dart';
import 'package:core/entity/register_request.dart';
import 'package:core/entity/result.dart';
import 'package:onboarding/repository/onboarding_repository.dart';

class PostRegisterUseCase
    extends UseCase<BaseResult<RegisterResponse>, RegisterRequest> {
  PostRegisterUseCase(this.repository);

  final OnBoardingRepository repository;

  @override
  Future<BaseResult<RegisterResponse>> call(RegisterRequest params) async {
    return await repository.postRegister(params);
  }
}
