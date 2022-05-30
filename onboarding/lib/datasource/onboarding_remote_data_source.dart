import 'package:core/data/remote/api_provider.dart';
import 'package:core/data/remote/constants.dart';
import 'package:core/entity/login_response.dart';
import 'package:core/entity/result.dart';
import 'package:core/entity/login_request.dart';
import 'package:core/base/base_data_source.dart';
import 'package:core/entity/register_response.dart';
import 'package:core/entity/register_request.dart';
import 'package:core/entity/otp_request.dart';
import 'package:core/entity/otp_response.dart';

class OnBoardingRemoteDataSource extends BaseDataSource {
  OnBoardingRemoteDataSource({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<BaseResult<LoginResponse>> postLogin(LoginRequest request) async {
    return getResult(apiProvider.post(URL_LOGIN, request.toJson()),
        (response) => LoginResponse.fromJson(response['data']));
  }

  Future<BaseResult<RegisterResponse>> postRegister(
      RegisterRequest request) async {
    return getResult(apiProvider.post(URL_REGISTER, request.toJson()),
        (response) => RegisterResponse.fromJson(response['data']));
  }

  Future<BaseResult<OtpResponse>> postOtpVerification(
      OtpRequest request) async {
    return getResult(apiProvider.put(URL_VERIFY, request.toJson()),
        (response) => OtpResponse.fromJson(response['data']));
  }
}
