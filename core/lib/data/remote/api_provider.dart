import 'package:core/core.dart';
import 'package:dio/dio.dart';

class ApiProvider with CacheManager {
  late Dio dio;

  ApiProvider() {
    dio = Api().dio;
    dio.interceptors.add(AliceInspector().alice.getDioInterceptor());
    dio.interceptors.add(ApiInterceptors());
  }

  Future<Response<dynamic>> get<T>(String url) async {
    final Response response = await dio.get(url);
    return response;
  }

  Future<Response<dynamic>> post<T>(
      String url, Map<String, dynamic> body) async {
    final Response response = await dio.post(url, data: body);
    return response;
  }

  Future<Response<dynamic>> postFormData<T>(String url, FormData body) async {
    final Response response = await dio.post(url, data: body);
    return response;
  }

  Future<Response<dynamic>> put<T>(
      String url, Map<String, dynamic> body) async {
    final Response response = await dio.put(url, data: body);
    return response;
  }

  Future<Response<dynamic>> putFormData<T>(String url, FormData body) async {
    final Response response = await dio.put(url, data: body);
    return response;
  }

  Future<Response<dynamic>> delete<T>(
      String url, Map<String, dynamic> body) async {
    final Response response = await dio.delete(url, data: body);
    return response;
  }

  Future<Response<dynamic>> update<T>(
      String url, Map<String, dynamic> body) async {
    final Response response = await dio.patch(url, data: body);
    return response;
  }
}
