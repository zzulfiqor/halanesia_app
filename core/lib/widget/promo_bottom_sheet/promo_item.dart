import 'package:cart/data/remote/get_coupon_response.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PromoItem extends StatelessWidget {
  final GetCouponResponseData? promoItem;
  final bool isSelected;
  const PromoItem({Key? key, this.isSelected = false, this.promoItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: isSelected ? secondary : neutralGrey,
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Promo Name & Remaining Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Text(
                promoItem?.name ?? '',
                style: bodyText.copyWith(color: basic),
              ),

              // Time & Details
              Row(
                children: [
                  // Berakhir Dalam
                  Text(
                      "berakhir ${DateTime.parse(promoItem?.expiredAt ?? "").difference(DateTime.now()).inDays} hari lagi",
                      style: subTitle2.copyWith(color: transparentGrey)),

                  // Time
                  SizedBox(
                    height: 30,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Lihat detail",
                        style: subTitle2.copyWith(
                          color: secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),

          // Icon
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: AnimatedScale(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 250),
              scale: isSelected ? 1 : 0,
              child: Icon(Icons.check,
                  color: isSelected ? secondary : Colors.transparent),
            ),
          )
        ],
      ),
    );
  }
}
