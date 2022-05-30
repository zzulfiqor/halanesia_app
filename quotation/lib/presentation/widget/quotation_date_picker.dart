import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotation/controller/quotation_date_picker_controller.dart';

class QuotationDatePicker extends StatelessWidget {
  final String title;
  final Function(DateTime)? onSelected;
  final DateTime? selectedDate;

  const QuotationDatePicker({
    Key? key,
    this.title = "",
    this.onSelected,
    this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(QuotationDatePickerController(),
        tag: DateTime.now().microsecondsSinceEpoch.toString());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: info1.copyWith(color: darkGrey)),
      const SizedBox(height: 8),
      GestureDetector(
        onTap: () async {
          var selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now().add(const Duration(days: 1)),
            firstDate: DateTime.now().add(const Duration(days: 1)),
            lastDate: DateTime.now().add(
              const Duration(days: 1000),
            ),
          );

          // save selected date
          controller.setDate(selectedDate);
          onSelected!(controller.selectedTime);
        },
        child: Obx(
          () => Container(
            decoration: BoxDecoration(
              border: Border.all(color: darkGrey),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Date
                Text(
                  controller.selectedTime == DateTime(1997) ||
                          selectedDate == DateTime.now()
                      ? "DD/MM/YYYY"
                      : selectedDate != DateTime.now()
                          ? "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}"
                          : "${controller.selectedTime.day}/${controller.selectedTime.month}/${controller.selectedTime.year}",
                  style: bodyText.copyWith(
                    color: controller.selectedTime == DateTime(1997)
                        ? neutralGrey
                        : black,
                  ),
                ),

                // Icon Date
                const SizedBox(width: 8),
                Image.asset(
                  'assets/images/ic_schedule.png',
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
