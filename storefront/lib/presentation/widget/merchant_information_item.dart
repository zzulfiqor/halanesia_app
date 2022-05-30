import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantInformationItem extends StatelessWidget {
  final String? title;
  final String? value;
  final bool hasInfoButton;
  final dynamic dialogValue;

  const MerchantInformationItem({
    Key? key,
    required this.title,
    required this.value,
    this.hasInfoButton = false,
    this.dialogValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          // Title
          SizedBox(
            width: Get.width * .3,
            child: Text(
              title!,
              style: subTitle3.copyWith(color: darkGrey),
            ),
          ),

          // Value
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Value
                Text(
                  value!,
                  style: title3.copyWith(color: secondary),
                ),

                // Info Button
                hasInfoButton
                    ? Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: GestureDetector(
                          onTap: () {
                            CommonDialog().showDetailInfo(title!,
                                content: Text(
                                  "Ini adalah deskripsi dari information detail",
                                  style: info1,
                                ));
                          },
                          child: const Icon(
                            Icons.info_outline,
                            size: 15,
                            color: darkGrey,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
