import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart/controller/cart_page_controller.dart';
import 'package:cart/data/remote/wishlist_response_model.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartFavoriteProductItem extends StatelessWidget {
  final WishlistResponseDataItems item;
  final CartPageController controller;
  const CartFavoriteProductItem(this.item, this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      child: Stack(
        children: [
          SizedBox(
            width: Get.width * .33,
            height: Get.height * .4,
            child: Card(
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: lightGrey.withOpacity(.3), width: 1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: InkWell(
                onTap: () {
                  Get.toNamed(RouteName.storeProductDetail +
                      "/${item.product?.productId}");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Ink.image(
                      image:
                          CachedNetworkImageProvider(item.product?.image ?? ''),
                      width: Get.width,
                      height: Get.height * .15,
                      fit: BoxFit.cover,
                    ),

                    // Name, Price
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name
                          Text(
                            item.product?.productName ?? "",
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
                                item.product?.price?[0]?.isDiscount != null
                                    // If Discounted
                                    ? formatCurrencyWithDecimal(
                                        int.parse(item.product?.price?[0]
                                                ?.discountPrice ??
                                            "0"),
                                      )
                                    // Not Discounted
                                    : formatCurrencyWithDecimal(
                                        item.product?.price?[0]?.price ?? 0),
                                style: title3,
                              ),

                              // Actual Price & Discount Percentage
                              const SizedBox(height: 4),
                              item.product?.price?[0]?.isDiscount != null
                                  ? Row(
                                      children: [
                                        // Actual Price
                                        Text(
                                          formatCurrencyWithDecimal(
                                              item.product?.price?[0]?.price ??
                                                  0),
                                          style: subTitle2.copyWith(
                                            color: darkGrey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),

                                        // Diccount Percent
                                        const SizedBox(width: 8),
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

                          // Store Name
                          const SizedBox(height: 14),
                          Text(
                            item.merchant?.name ?? "",
                            style: info1.copyWith(color: secondary),
                          ),
                          const SizedBox(height: 4),
                          // Row(
                          //   children: [
                          //     // Icon
                          //     Opacity(
                          //       opacity: .75,
                          //       child: Image.asset(
                          //         'assets/images/storefront_location.png',
                          //         height: 16,
                          //         width: 16,
                          //       ),
                          //     ),

                          //     // Store City
                          //     const SizedBox(width: 4),
                          //     Expanded(
                          //       child: Text(
                          //         item.merchant?.name ?? "",
                          //         style: info1.copyWith(color: darkGrey),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // Add To Cart Button
          Positioned(
            bottom: 15,
            right: 15,
            left: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Ink(
                    child: SizedBox(
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.addCart(
                              int.parse(item.product?.productDetailId ?? "0"),
                              item.product?.minOrder ?? 1,
                            );

                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              controller.getCartItems();
                            });
                          },
                          child: Text(
                            "+ Keranjang",
                            style: subTitle2.copyWith(
                              color: white,
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
