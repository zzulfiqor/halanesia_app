import 'package:cart/data/remote/get_coupon_response.dart';
import 'package:core/core.dart';
import 'package:core/widget/promo_bottom_sheet/controller/promo_bottom_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoBottomSheet extends GetView<PromoBottomSheetController> {
  final Function() onTapUse;
  final Function(GetCouponResponseData) onItemTap;
  final List<GetCouponResponseData> promoList;
  final GetCouponResponseData? selectedItem;

  const PromoBottomSheet(
      {Key? key,
      required this.onTapUse,
      required this.promoList,
      required this.onItemTap,
      this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if selected item not empty
    if (selectedItem != null) {
      controller.selectedPromo = selectedItem!;
    }
    return Obx(
      () {
        return Container(
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.only(top: 2, bottom: 8, left: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              ListTile(
                title: Text(
                  "Promo",
                  style: header,
                ),
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    color: basic,
                  ),
                ),
              ),

              // Promo Text Input
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Row(
              //     children: [
              //       // Input Promo
              //       Expanded(
              //         child: SizedBox(
              //           height: 45,
              //           child: TextField(
              //             controller: controller.promoTextInputController,
              //             decoration: const InputDecoration(
              //               contentPadding:
              //                   EdgeInsets.symmetric(horizontal: 12),
              //               hintText: "Masukkan kode promo",
              //               border: OutlineInputBorder(
              //                 borderSide: BorderSide(
              //                   color: basic,
              //                   width: 2,
              //                 ),
              //               ),
              //             ),
              //             style: bodyText,
              //           ),
              //         ),
              //       ),

              //       // Button
              //       const SizedBox(width: 8),
              //       SizedBox(
              //         height: 42,
              //         child: ElevatedButton(
              //           onPressed: () => onTapUse(),
              //           child: const Text("Gunakan"),
              //         ),
              //       )
              //     ],
              //   ),
              // ),

              // Choose Promo Title
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                child: Text("Pilih Promo", style: header),
              ),

              // List Promo
              promoList.length == 0
                  ? Container(
                      alignment: Alignment.center,
                      height: Get.height * .4,
                      child: const Text("Tidak ada promo"),
                    )
                  : Column(
                      children: promoList
                          .map((e) => GestureDetector(
                                onTap: () {
                                  onItemTap(e);
                                  controller.selectedPromo = e;
                                  Future.delayed(
                                      const Duration(milliseconds: 250), () {
                                    Get.back();
                                  });
                                },
                                child: PromoItem(
                                  promoItem: e,
                                  isSelected: controller.selectedPromo == e,
                                ),
                              ))
                          .toList(),
                    )
            ],
          ),
        );
      },
    );
  }
}
