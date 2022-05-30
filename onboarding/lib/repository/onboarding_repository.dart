import 'package:core/entity/login_response.dart';
import 'package:core/entity/result.dart';
import 'package:core/entity/login_request.dart';
import 'package:onboarding/datasource/onboarding_remote_data_source.dart';
import 'package:core/data/remote/connection_info.dart';
import 'package:core/entity/register_response.dart';
import 'package:core/entity/register_request.dart';
import 'package:core/entity/otp_request.dart';
import 'package:core/entity/otp_response.dart';

abstract class OnBoardingRepository {
  Future<BaseResult<LoginResponse>> postLogin(LoginRequest request);

  Future<BaseResult<RegisterResponse>> postRegister(RegisterRequest request);

  Future<BaseResult<OtpResponse>> postOtpVerification(OtpRequest request);
}

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  OnBoardingRepositoryImpl(this.getLoginRemoteDataSource);

  final OnBoardingRemoteDataSource getLoginRemoteDataSource;

  @override
  Future<BaseResult<LoginResponse>> postLogin(LoginRequest request) async {
    return await getLoginRemoteDataSource.postLogin(request);
  }

  @override
  Future<BaseResult<RegisterResponse>> postRegister(
      RegisterRequest request) async {
    return await getLoginRemoteDataSource.postRegister(request);
  }

  @override
  Future<BaseResult<OtpResponse>> postOtpVerification(
      OtpRequest request) async {
    return await getLoginRemoteDataSource.postOtpVerification(request);
  }
}
