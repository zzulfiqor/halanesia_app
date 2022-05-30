import 'package:get/get.dart';
import 'package:home/controller/wishlist_controller.dart';


class WishlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WishlistController());
  }
}
