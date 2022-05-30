import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:notification/data/model/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel data;
  const NotificationItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          // Item
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon type
                Image.asset('assets/images/ic_shop.png', height: 20),

                // Notification Item
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text(
                        data.title ?? '',
                        style: header.copyWith(color: black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // subtitle
                      const SizedBox(height: 8),
                      Text(
                        data.subTitle ?? '',
                        style: bodyText.copyWith(color: black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // content
                      const SizedBox(height: 12),
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: secondary, width: 2),
                        ),
                        child: Row(
                          children: [
                            // Images
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(8)),
                              child: Image.asset(
                                  'assets/images/dummy_product_image.png',
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover),
                            ),

                            // Product Name
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Nama Produk',
                                style: bodyText.copyWith(color: black),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            // Button Shevron Right
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.chevron_right_rounded,
                              color: secondary,
                            ),
                          ],
                        ),
                      ),

                      // time
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          // Icon Clock
                          Image.asset('assets/images/clock.png', height: 18),

                          // Time
                          const SizedBox(width: 8),
                          Text(
                            data.time ?? '',
                            style: subTitle3.copyWith(
                              color: darkGrey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Divider
          const Divider(
            thickness: 1,
            color: neutralGrey,
          ),
        ],
      ),
    );
  }
}
