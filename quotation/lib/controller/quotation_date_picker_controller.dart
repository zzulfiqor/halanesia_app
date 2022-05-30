import 'package:core/base/base_controller.dart';
import 'package:get/get.dart';

class QuotationDatePickerController extends BaseController {
  // Selected Time
  final _selectedTime = DateTime(1997).obs;
  DateTime get selectedTime => _selectedTime.value;
  set selectedTime(DateTime time) {
    _selectedTime.value = time;
  }

  // set date
  void setDate(DateTime? selectedDate) {
    if (selectedDate != null) {
      selectedTime = selectedDate;
    }
  }
}
