import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/controller/fragment_quotation_controller.dart';
import 'package:storefront/presentation/widget/merchant_quotation_item.dart';

class StorefrontTabviewQuotation extends GetView<FragmentQuotationController> {
  const StorefrontTabviewQuotation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isFirstLoad == true
          ? loadingCircle()
          : ListView.builder(
              // controller: controller.scrollController,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: controller.quotations.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0
                        ? // Title
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 20,
                              bottom: 10,
                            ),
                            child: Text(
                              "Pengadaan Dari Toko",
                              style: header,
                            ),
                          )
                        : Container(),

                    // Item
                    MerchantQuotationItem(
                      quotation: controller.quotations[index],
                      isActive: controller.quotations[index].deadline != null
                          ? DateTime.parse(controller
                                          .quotations[index].deadline!)
                                      .difference(DateTime.now())
                                      .inDays >=
                                  1
                              ? true
                              : false
                          : false,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
