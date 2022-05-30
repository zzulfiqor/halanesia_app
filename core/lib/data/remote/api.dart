import 'package:core/data/remote/constants.dart';
import 'package:dio/dio.dart';

import '../../core.dart';

class Api {
  final dio = createDio();

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));
    dio.interceptors.add(AliceInspector().alice.getDioInterceptor());
    return dio;
  }
}
