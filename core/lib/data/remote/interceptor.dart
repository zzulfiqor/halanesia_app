import 'dart:convert';

import 'package:core/data/cache/cache_manager.dart';
import 'package:core/data/remote/api.dart';
import 'package:core/data/remote/api_provider.dart';
import 'package:core/data/remote/api_service.dart';
import 'package:core/data/remote/constants.dart';
import 'package:dio/dio.dart';
import 'package:core/utils/util.dart';

class ApiInterceptors extends Interceptor with CacheManager {
  late Dio _dio;

  ApiInterceptors() {
    _dio = Api().dio;
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? _accessToken = getToken();
    options.headers.addAll({
      if (_accessToken.isNotEmpty) "Authorization": _accessToken,
      Headers.contentTypeHeader: Headers.jsonContentType,
    });
    String? deviceInfo = await Util().getDeviceInfo();

    if (deviceInfo != null) {
      options.headers.addAll({...json.decode(deviceInfo)});
    }
    options.headers.addAll({"RequestId": await Util().getRequestId()});
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    String? _refreshToken = getRefreshToken();
    final RequestOptions? options = err.requestOptions;
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != URL_TOKEN &&
        _refreshToken.isNotEmpty) {
      _dio.lock();
      bool refresh = await ApiService().refreshToken(getRefreshToken());
      if (refresh) {
        _dio.unlock();
        options?.headers['Authorization'] = getToken();
        ApiProvider().dio.options.headers['Authorization'] = getToken();
        final Response response = await _dio.fetch(options!);
        return handler.resolve(response);
      } else {
        _dio.unlock();
        clearAll();
        Util().goToLogin();
      }
    }
    return handler.resolve(err.response!);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }
}
