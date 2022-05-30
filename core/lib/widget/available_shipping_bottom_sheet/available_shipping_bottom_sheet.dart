import 'package:cart/data/remote/shipping_rates_reponse.dart';
import 'package:core/core.dart';
import 'package:core/widget/available_shipping_bottom_sheet/controller/available_shipping_bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetAvailableShipping
    extends GetView<AvailableShippingBottomSheetController> {
  final ShippingRatesResponseDataPricingsLogistics selectedCourier;
  final List<ShippingRatesResponseDataPricingsLogistics>? availableCourier;
  final Function(ShippingRatesResponseDataPricingsLogistics) onSelected;
  const BottomSheetAvailableShipping({
    Key? key,
    this.availableCourier,
    required this.onSelected,
    required this.selectedCourier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            color: white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: basic,
                        )),
                    title: Text(
                      "Pilih Pengiriman",
                      style: header,
                    ),
                  ),

                  // list shipping
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: availableCourier == null
                        ? []
                        : availableCourier!.map((e) {
                            return GestureDetector(
                              onTap: () {
                                controller.selectedCourier = e;
                                onSelected(e);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Obx(() => CourierItem(
                                      courier: e,
                                      isSelected: controller
                                                  .selectedCourier.detail?.id ==
                                              e.detail?.id
                                          ? true
                                          : false,
                                    )),
                              ),
                            );
                          }).toList(),
                  ),

                  // Spacer
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ));
  }
}
