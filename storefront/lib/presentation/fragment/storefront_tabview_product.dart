import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:storefront/controller/fragment_product_controller.dart';
import 'package:storefront/presentation/widget/merchant_product_card.dart';

class StorefrontTabviewProduk extends GetView<FragmentProductController> {
  const StorefrontTabviewProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Stack(children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Semua Produk",
                style: header,
              ),
            ),

            // product
            Obx(() => MasonryGridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemCount: controller.productList.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                mainAxisSpacing: 8,
                crossAxisSpacing: 12,
                itemBuilder: (count, index) {
                  return MerchantProductCard(
                      data: controller.productList[index]);
                })),
          ],
        ),
      ]),
    );
  }
}
