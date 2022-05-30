import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onClicked;
  final double horizontalPadding;

  const ProfileItem(
      {Key? key,
      required this.title,
      required this.image,
      this.onClicked,
      this.horizontalPadding = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      highlightColor: Colors.transparent,
      child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
          child: Row(
            children: [
              loadImageAssetSquare(image, 20),
              const SizedBox(width: 25),
              Expanded(child: Text(title, style: header.copyWith(color: basic)))
            ],
          )),
    );
  }
}
