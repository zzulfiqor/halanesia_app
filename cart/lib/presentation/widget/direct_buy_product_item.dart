import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart/controller/cart_item_controller.dart';
import 'package:cart/data/remote/checkout_response.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DirectBuyProductItem extends StatelessWidget {
  final CheckoutResponseDataProducts data;

  const DirectBuyProductItem({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
        CartItemController(int.parse(data.productDetailId ?? "0")),
        tag: data.productDetailId ?? "0");
    controller.itemCount = data.quantity ?? 0;
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
                    image: CachedNetworkImageProvider(data.image ?? ''),
                  ),
                ),
                width: 70,
                height: 70,
              ),

              // Name & Price
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    data.productName ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: info1,
                  ),

                  // Price
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        formatCurrencyWithDecimal(data.price ?? 0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: title3,
                      ),

                      // Counter
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          // Button Substract
                          Text(
                            "x " + data.quantity.toString() + " Qty",
                            style: subTitle3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
