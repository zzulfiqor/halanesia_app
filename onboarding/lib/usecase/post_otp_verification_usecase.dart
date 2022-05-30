import 'package:core/data/remote/usecase.dart';
import 'package:core/entity/otp_request.dart';
import 'package:core/entity/otp_response.dart';
import 'package:core/entity/result.dart';
import 'package:onboarding/repository/onboarding_repository.dart';

class PostOtpVerificationUseCase extends UseCase<BaseResult<OtpResponse>, OtpRequest> {
  PostOtpVerificationUseCase(this.repository);

  final OnBoardingRepository repository;

  @override
  Future<BaseResult<OtpResponse>> call(OtpRequest params) async {
    return await repository.postOtpVerification(params);
  }
}
