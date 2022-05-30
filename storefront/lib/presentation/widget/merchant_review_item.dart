import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:storefront/data/request/merchant_review_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class MerchantReviewItem extends StatelessWidget {
  final MerchantReviewEntity data;
  const MerchantReviewItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Picture, Username, Option Button
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // Profile Picture
              data.userImage == null
                  ? Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile_2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundColor: neutralGrey,
                      backgroundImage: CachedNetworkImageProvider(
                        data.userImage!,
                      ),
                    ),

              // Username
              const SizedBox(width: 12),
              Expanded(
                child: Text("${data.userName}"),
              ),

              // Option Button
              const Icon(Icons.more_vert),
            ],
          ),
        ),

        // Icon Rating
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              // Star Icon
              const Icon(
                Icons.star,
                size: 18,
                color: star,
              ),

              // Rating
              const SizedBox(width: 4),
              Text(
                "${data.rate}/5",
                style: subTitle3,
              ),
            ],
          ),
        ),

        // Review
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
          child: Row(
            children: [
              // Review
              Expanded(
                child: Text(
                  "${data.comment}",
                  style: bodyText,
                ),
              ),
            ],
          ),
        ),

        // Timestamp
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              // Timestamp
              Expanded(
                child: data.createdDate != null
                    ? Text(
                        DateFormat('dd MMMM yyyy, hh:mm WIB').format(
                            DateTime.parse(data.createdDate!).toLocal()),
                        style: subTitle3.copyWith(color: darkGrey),
                      )
                    : const Text('-'),
              ),
            ],
          ),
        ),

        // Divider
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Divider(
            color: neutralGrey,
            thickness: 1,
          ),
        ),

        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
