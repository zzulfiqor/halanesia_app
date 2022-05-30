
import 'package:get/get.dart';
import 'package:notification/controller/notification_controller.dart';

class NotificationBinding implements Bindings{
  @override
  void dependencies() {
        Get.put(NotificationController());

  }

} 