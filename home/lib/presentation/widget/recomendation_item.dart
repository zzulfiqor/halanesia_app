import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecomendationItem extends StatelessWidget {
  final String? image;
  final String? title;
  final String? city;

  const RecomendationItem({Key? key, this.image, this.title, this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: lightGrey.withOpacity(.4), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      height: 120,
      width: 100,
      child: Column(
        children: [
          // Image
          if (image != null)
            CachedNetworkImage(
              imageUrl: image!,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),

          // Title
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: info1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: secondary,
                ),
              ),
            ),

          // City
          Text(
            "Kab. Manual",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: info1.copyWith(color: darkGrey),
          ),
        ],
      ),
    );
  }
}
