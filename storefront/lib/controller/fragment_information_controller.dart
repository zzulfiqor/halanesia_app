import 'package:core/base/base_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class FragmentInformationController extends BaseController {
  Future<void> goToWebsite(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
