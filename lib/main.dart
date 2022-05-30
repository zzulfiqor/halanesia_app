import 'package:core/core.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_center_plugin/app_center_plugin.dart';

const androidSecret = '5d5c1fb9-f33e-4fb0-8388-c634490bd42c';
const iOSSecret = '9006132e-3ff4-453f-a08d-2be534bb36ff';

void main() async {
  await GetStorage.init();
  final secret = Platform.isAndroid ? androidSecret : iOSSecret;
  await AppCenter.start(secret);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppCenter.trackEvent('MyApp');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halanesia',
      navigatorKey: AliceInspector().alice.getNavigatorKey(),
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: white,
        errorColor: bad,
        colorScheme: ThemeData().colorScheme.copyWith(primary: secondary),
      ),
      initialBinding: MainBinding(),
      // initialRoute: RouteName.storefront + '/66',
      initialRoute: RouteName.login,
      unknownRoute: AppPages.unknownPage,
      getPages: AppPages.pages,
    );
  }
}
