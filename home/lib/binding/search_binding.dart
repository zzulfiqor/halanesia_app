import 'package:get/get.dart';
import 'package:home/controller/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}
