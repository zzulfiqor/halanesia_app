import 'package:core/base/base_controller.dart';
import 'package:get/get.dart';

class QuotationCheckboxController extends BaseController {

  //  selected values
  final _selectedValues = <String>[].obs;
  List<String> get selectedValues => _selectedValues;
  set selectedValues(List<String> value) {
    _selectedValues.value = value;
  }

  //  select item
  void selectItem(String value) {
    if (selectedValues.contains(value)) {
      selectedValues.remove(value);
    } else {
      selectedValues.add(value);
    }
  }
}
