import 'package:cart/data/remote/shipping_rates_reponse.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourierItem extends StatelessWidget {
  final ShippingRatesResponseDataPricingsLogistics? courier;
  final bool? isSelected;
  final bool? useBorder;
  const CourierItem({
    Key? key,
    this.courier,
    this.isSelected = false,
    this.useBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime minEstimation =
        DateTime.now().add(Duration(days: courier?.detail?.rates?.minDay ?? 0));
    DateTime maxEstimation =
        DateTime.now().add(Duration(days: courier?.detail?.rates?.maxDay ?? 0));

    return Container(
      padding: useBorder == true
          ? const EdgeInsets.symmetric(horizontal: 11, vertical: 8)
          : const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: useBorder == true
              ? Border.all(
                  color: isSelected! ? secondary : transparentGrey,
                  width: isSelected! ? 2 : 1)
              : null),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Information
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name (Price)
              Text(
                  courier!.name! +
                      " " +
                      "${courier?.detail?.type}" +
                      " (${formatCurrencyWithDecimal(courier?.detail?.rates?.finalPrice ?? 0)}) ",
                  style: bodyText),

              // Estimate Time
              const SizedBox(height: 5),
              minEstimation.month == maxEstimation.month &&
                      minEstimation.year == maxEstimation.year
                  ? Text(
                      "Estimasi tiba ${minEstimation.day}-${maxEstimation.day} ${getMonthNameFromDate(minEstimation)} ${minEstimation.year}",
                      style: subTitle3.copyWith(color: transparentGrey))
                  : minEstimation.month == maxEstimation.month &&
                          minEstimation.year != maxEstimation.year
                      ? Text(
                          "Estimasi tiba ${minEstimation.day} ${getMonthNameFromDate(minEstimation)} ${minEstimation.year} - ${maxEstimation.day} ${getMonthNameFromDate(minEstimation)} ${maxEstimation.year}",
                          style: subTitle3.copyWith(color: transparentGrey))
                      : Text(
                          "Estimasi tiba ${minEstimation.day} ${getMonthNameFromDate(minEstimation)} -${maxEstimation.day} ${getMonthNameFromDate(minEstimation)} ${minEstimation.year}",
                          style: subTitle3.copyWith(color: transparentGrey)),
            ],
          ),

          // checked
          AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: Icon(Icons.check,
                  color: secondary, size: isSelected! ? 24 : 0)),
        ],
      ),
    );
  }
}
