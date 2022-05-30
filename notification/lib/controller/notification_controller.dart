import 'package:core/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:notification/data/model/notification_model.dart';

class NotificationController extends BaseController {
  // selected filter
  final _selectedFilter = "User".obs;
  String get selectedFilter => _selectedFilter.value;
  set selectedFilter(String value) => _selectedFilter.value = value;

  // notification loading state
  final _notificationLoading = true.obs;
  bool get notificationLoading => _notificationLoading.value;
  set notificationLoading(bool value) => _notificationLoading.value = value;

  // notification list
  final _notificationList = <NotificationModel>[].obs;
  List<NotificationModel> get notificationList => _notificationList.value;
  set notificationList(List<NotificationModel> value) =>
      _notificationList.value = value;

  // on init
  @override
  void onInit() {
    super.onInit();

    getNotificationList();
  }

  // select filter
  void selectFilter(String value) {
    selectedFilter = value;
    getNotificationList();
  }

  // get notification list
  Future<void> getNotificationList() async {
    // set loading state
    notificationLoading = true;

    // get notification list
    await Future.delayed(const Duration(seconds: 1), () {
      notificationList = notifications;
    });

    // set loading state
    notificationLoading = false;
  }
}
