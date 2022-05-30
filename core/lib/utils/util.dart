import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

import 'package:core/core.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Util {
  late DeviceInfoPlugin deviceInfoPlugin;

  Util() {
    deviceInfoPlugin = DeviceInfoPlugin();
  }
  goToLogin() {
    Get.offNamed(RouteName.login);
  }

  Future<String?> getRequestId() async {
    try {
      int timestamp = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
      DateTime _now = DateTime.now().toUtc();
      ;
      final DateFormat formatter = DateFormat('yyMMdd');
      final String formatted = formatter.format(_now);
      var devId = await Util().getDeviceId();
      var reqId = Util().getChannelPrefix() +
          formatted +
          timestamp.toString() +
          devId.substring(devId.length - 3);
      return reqId;
    } catch (e) {
      return null;
    }
  }

  getDeviceId() async {
    try {
      final deviceInfo = await deviceInfoPlugin;
      if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor;
      } else if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.androidId;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  getChannelPrefix() {
    if (Platform.isIOS) {
      return PREFIX_IOS;
    } else if (Platform.isAndroid) {
      return PREFIX_ANDROID;
    } else {
      return PREFIX_UNKNOWN;
    }
  }

  getDeviceInfo() async {
    try {
      final deviceInfo = await deviceInfoPlugin;
      if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        var dev = {
          "platform": "ios",
          "name": iosInfo.name,
          "model": iosInfo.model,
          "machine": iosInfo.utsname.machine,
          "deviceId": iosInfo.identifierForVendor,
          "isPhysicalDevice": iosInfo.isPhysicalDevice,
          "osVersion": iosInfo.systemVersion
        };
        return json.encode(dev).toString();
      } else if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        var dev = {
          "platform": "android",
          "name": androidInfo.device,
          "model": androidInfo.model,
          "machine": androidInfo.hardware,
          "deviceId": androidInfo.androidId,
          "isPhysicalDevice": androidInfo.isPhysicalDevice,
          "osVersion": androidInfo.version.sdkInt
        };
        return json.encode(dev).toString();
      } else {
        final deviceInfo = await deviceInfoPlugin.deviceInfo;
        final map = deviceInfo.toMap();
        return map;
      }
    } catch (e) {
      return "";
    }
  }
}
