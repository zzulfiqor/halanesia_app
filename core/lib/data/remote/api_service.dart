import 'dart:convert';

import 'package:core/core.dart';
import 'package:core/data/remote/constants.dart';
import 'package:core/utils/util.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ApiService with CacheManager {
  Future<bool> refreshToken(String refreshToken) async {
    try {
      var dio = Dio(); //new instance of Dio so wont affected by locking
      final Uri apiUri = Uri.parse(BASE_URL + URL_TOKEN);
      dio.options.headers.addAll({
        if (refreshToken != null) "Authorization": refreshToken,
        Headers.contentTypeHeader: Headers.jsonContentType,
      });

      dio.interceptors
          .add(AliceInspector().alice.getDioInterceptor()); //add alice
      String? deviceInfo = await Util().getDeviceInfo();

      if (deviceInfo != null) {
        dio.options.headers.addAll({...json.decode(deviceInfo)});
      }

      dio.options.headers.addAll({"RequestId": await Util().getRequestId()});
      Response response = await dio.postUri(apiUri);
      if (response.statusCode == HttpStatus.ok) {
        var resp = response.data['data'];
        String tAccess = resp['access_token'];
        String tRefresh = resp['refresh_token'];
        String tType = resp['token_type'];
        if (tAccess.isNotEmpty && tRefresh.isNotEmpty) {
          saveToken(tAccess, tRefresh, tType);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
