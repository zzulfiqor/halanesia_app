import 'package:core/entity/result.dart';
import 'package:dio/dio.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class BaseDataSource {
  Future<BaseResult<T>> getResult<T>(
      Future<Response<dynamic>> call, ResponseConverter<T> converter) async {
    try {
      var response = await call;
      if (response.statusCode == 200) {
        var transform = converter(response.data);
        return BaseResult.success(transform);
      } else {
        return BaseResult.error(
            response.data['errorCode'] ?? 0, response.data['errorDesc'] ?? '');
      }
    } on DioError catch (e) {
      return BaseResult.error(0, 'Terjadi Kesalahan Jaringan');
    }
  }

  Future<BaseResult<T>> getResultWithEmptyResponse<T>(
      Future<Response<dynamic>> call) async {
    try {
      var response = await call;
      if (response.statusCode == 204) {
        return BaseResult.success(null);
      } else {
        return BaseResult.error(0, '');
      }
    } on DioError catch (e) {
      return BaseResult.error(0, 'Terjadi Kesalahan');
    }
  }
}
