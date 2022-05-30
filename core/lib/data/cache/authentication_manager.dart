import 'package:get/get.dart';
import 'cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  @override
  void onInit() {
    isLogged.value = hasLogin();
    super.onInit();
  }

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token, String? refreshToken, String? tokenType) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token, refreshToken, tokenType);
  }
}