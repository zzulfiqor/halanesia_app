import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/data/response/merchant_workhour_response.dart';

class ProfileWorkhour extends StatelessWidget {

  // final MerchantDay day;
  final bool value;
  final String title;
  final VoidCallback onSelect;

  const ProfileWorkhour({ Key? key, required this.value, required this.title, required this.onSelect }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onSelect,
        child: Row(
          children: [
            loadImageAssetSquare(
              value
                ? "assets/images/checkbox_checked.png"
                : "assets/images/checkbox_unchecked.png",
              20
            ),
            const SizedBox(width: 15,),
            Text(
              title,
              style: bodyText.copyWith(color: basic),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}