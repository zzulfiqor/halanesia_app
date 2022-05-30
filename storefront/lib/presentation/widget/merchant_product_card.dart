import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storefront/controller/merchant_product_card_controller.dart';
import 'package:storefront/data/request/merchant_product_response.dart';

class MerchantProductCard extends StatelessWidget {
  final ProductEntity data;
  const MerchantProductCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MerchantProductCardController(),
        tag: data.productId.toString());

    if (data.isInWishlist == true) {
      controller.isFavorite = true;
    }
    return SizedBox(
      width: Get.width * .4,
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: lightGrey.withOpacity(.3), width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            // Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                data.productImage == null
                    // No image
                    ? Image.asset(
                        'assets/images/image_placeholder.png',
                        height: Get.width * .35,
                        width: Get.width,
                        fit: BoxFit.cover,
                      )

                    // Image
                    : Image.network(
                        data.productImage!,
                        height: Get.width * .35,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),

                // Name, Price, Rating & Like
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        data.productTitle ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: info1,
                      ),

                      // Price
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // end price
                          Text(
                            formatCurrencyWithDecimal(data.price ?? 0),
                            style: title3,
                          ),

                          // Actual Price & Discount Percentage
                          const SizedBox(height: 4),
                          data.discount != null
                              ? Row(
                                  children: [
                                    // Actual Price
                                    const SizedBox(width: 12),
                                    Text(
                                      formatCurrencyWithDecimal(
                                          data.price ?? 0),
                                      style: subTitle2.copyWith(
                                        color: darkGrey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),

                                    // Diccount Percent
                                    const SizedBox(width: 12),
                                    Text(
                                      "25%",
                                      style: subTitle2.copyWith(
                                        color: red,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),

                      // Rating
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          // Star Icon
                          const Icon(
                            Icons.star,
                            color: star,
                            size: 20,
                          ),

                          // Rating Value
                          const SizedBox(width: 4),
                          Text(
                            "${data.rating ?? '0'}/5",
                            style: info1,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                )
              ],
            ),

            // Splash
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: secondary.withOpacity(.1),
                  onTap: () {
                    Get.toNamed(
                        RouteName.storeProductDetail + '/${data.productId}');
                  },
                  child: Ink(),
                ),
              ),
            ),

            // Favorite Button
            Positioned(
              bottom: 19,
              right: 12,
              child: Obx(() => GestureDetector(
                    onTap: () {
                      controller.isFavorite = !controller.isFavorite;
                      if (controller.isFavorite) {
                        controller.createWishlist(data.productDetailId!);
                      } else {
                        controller.deleteWishlist(data.productDetailId!);
                      }
                    },
                    child: controller.isFavorite == true
                        ? const Icon(
                            Icons.favorite,
                            size: 20,
                            color: red,
                          )
                        : const Icon(
                            Icons.favorite_outline_outlined,
                            size: 20,
                            color: red,
                          ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
