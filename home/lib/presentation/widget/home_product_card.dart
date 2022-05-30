import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/controller/home_controller.dart';
import 'package:home/controller/home_product_card_controller.dart';
import 'package:home/data/remote/product_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeProductCard extends StatelessWidget {
  final ProductEntity data;
  const HomeProductCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller =
        Get.put(HomeProductCardController(), tag: data.productId.toString());

    if (data.isInWishlist == true) {
      controller.isFavorite = true;
    }

    return SizedBox(
      width: Get.width * .375,
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
                CachedNetworkImage(
                  imageUrl: data.productImage!,
                  fit: BoxFit.cover,
                  height: Get.width * .35,
                  width: Get.width,
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
                            formatCurrencyWithDecimal(data.price!),
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
                                          data.originalPrice!),
                                      style: subTitle2.copyWith(
                                        color: darkGrey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),

                                    // Diccount Percent
                                    const SizedBox(width: 12),
                                    Text(
                                      "${data.discount}%",
                                      style: subTitle2.copyWith(
                                        color: red,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),

                      // Store Name
                      const SizedBox(height: 14),
                      Text(
                        data.storeName!,
                        style: info1.copyWith(color: secondary),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          // Icon
                          Opacity(
                            opacity: .75,
                            child: Image.asset(
                              'assets/images/storefront_location.png',
                              height: 16,
                              width: 16,
                            ),
                          ),

                          // Store City
                          const SizedBox(width: 4),
                          Text(
                            data.location!,
                            style: info1.copyWith(color: darkGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),

            // Splash
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: secondary.withOpacity(.1),
                  onTap: () async {
                    var fromDetail = await Get.toNamed(
                        RouteName.storeProductDetail + "/${data.productId}");

                    if (fromDetail) {
                      Get.find<HomeController>().getCartCount();
                    }
                  },
                  child: Ink(),
                ),
              ),
            ),

            // Favorite Button
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(() => SizedBox(
                      width: Get.width * .475,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Rating
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
                                "${data.rating}/5",
                                style: info1,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              controller.isFavorite = !controller.isFavorite;
                              if (controller.isFavorite) {
                                controller
                                    .createWishlist(data.productDetailId!);
                              } else {
                                controller
                                    .deleteWishlist(data.productDetailId!);
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
                          ),
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
