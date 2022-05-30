import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotation/controller/quotation_checkbox_controller.dart';

class QuotationGroupCheckbox extends StatelessWidget {
  final String title;
  final List<String>? items;
  final TextInputType? keyboardType;
  final int minLines;
  final int? maxLines;
  final double? formHeight;
  final bool isCurrency;
  final bool isNullable;
  final Function(List<String>) onChecked;

  const QuotationGroupCheckbox({
    Key? key,
    this.title = "",
    this.keyboardType = TextInputType.text,
    this.minLines = 1,
    this.maxLines = 1,
    this.isCurrency = false,
    this.formHeight,
    this.items,
    this.isNullable = true,
    required this.onChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuotationCheckboxController controller = Get.put(
        QuotationCheckboxController(),
        tag: "cb-${items?.map((e) => e.hashCode).join('-')}");
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: info1.copyWith(color: darkGrey)),
      Container(
        padding: const EdgeInsets.only(top: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkboxes
            Obx(
              () => Column(
                children: items
                        ?.map((item) => Row(
                              children: [
                                Checkbox(
                                  value:
                                      controller.selectedValues.contains(item),
                                  onChanged: (value) {
                                    controller.selectItem(item);
                                    onChecked(controller.selectedValues);
                                  },
                                ),
                                GestureDetector(
                                    onTap: () {
                                      controller.selectItem(item);
                                      onChecked(controller.selectedValues);
                                    },
                                    child: Text(item,
                                        style:
                                            bodyText.copyWith(color: black))),
                              ],
                            ))
                        .toList() ??
                    [],
              ),
            ),

            // Error Message
            isNullable
                ? const SizedBox()
                : Obx(() {
                    return controller.selectedValues.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Anda belum memilih ${title.toLowerCase()}",
                              style: subTitle2.copyWith(color: bad),
                            ),
                          )
                        : const SizedBox();
                  }),
          ],
        ),
      ),
    ]);
  }
}
