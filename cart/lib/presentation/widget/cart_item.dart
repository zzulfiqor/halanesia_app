import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart/controller/cart_item_controller.dart';
import 'package:cart/data/remote/cart_item_model.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  final CartItemModelDataMerchantProduct data;
  final bool isFromCart;
  const CartItem({Key? key, this.isFromCart = true, required this.data})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
        CartItemController(int.parse(data.productDetail?[0]?.id ?? "0")),
        tag: data.productDetail?[0]?.id);
    controller.itemCount = data.productDetail?[0]?.cart?.qt ?? 0;
    controller.oldItemCount = data.productDetail?[0]?.cart?.qt ?? 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          // Product Information
          Row(
            children: [
              // Image
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: lightGrey),
                  color: lightGrey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        data.productDetail?[0]?.image?.imgUrl ?? ''),
                  ),
                ),
                width: 70,
                height: 70,
              ),

              // Name & Price
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      data.name ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: info1,
                    ),

                    // Price
                    const SizedBox(height: 5),
                    Text(
                      formatCurrencyWithDecimal(
                          data.productDetail?[0]?.prices?[0]?.price ?? 0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: title3,
                    ),
                  ],
                ),
              ),

              // Counter
              Row(
                children: [
                  // Button Substract
                  Obx(
                    () => InkWell(
                      onTap: controller.itemCount > data.minOrder!
                          ? () {
                              controller.countSub(data.minOrder ?? 0);
                            }
                          : null,
                      child: Ink(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: controller.itemCount > data.minOrder!
                                ? secondary
                                : neutralGrey,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "-",
                            style: subTitle1.copyWith(
                                color: controller.itemCount > data.minOrder!
                                    ? secondary
                                    : neutralGrey),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Counter Value
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Ink(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: darkGrey,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Obx(() {
                          return Text(
                            "${controller.itemCount}",
                            style: bodyText.copyWith(color: basic),
                          );
                        }),
                      ),
                    ),
                  ),

                  // Button Add
                  Obx(() => InkWell(
                        onTap: controller.itemCount <
                                data.productDetail![0]!.stock!
                            ? () {
                                controller.countAdd(
                                    data.productDetail?[0]?.stock ?? 0);
                              }
                            : null,
                        child: Ink(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: controller.itemCount <
                                      data.productDetail![0]!.stock!
                                  ? secondary
                                  : neutralGrey,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "+",
                              style: subTitle1.copyWith(
                                  color: controller.itemCount <
                                          data.productDetail![0]!.stock!
                                      ? secondary
                                      : neutralGrey),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),

          // Delete Button
          isFromCart == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Delete Button
                    InkWell(
                      onTap: () {
                        controller.deleteCart(
                            int.parse(data.productDetail?[0]?.cart?.id ?? "0"));
                      },
                      child: Ink.image(
                        image: const AssetImage("assets/images/ic_trash.png"),
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
