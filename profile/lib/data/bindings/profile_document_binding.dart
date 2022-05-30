import 'package:get/get.dart';

import '../../presentation/controller/profile_document_controller.dart';

class ProfileDocumentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileDocumentController());
  }
}