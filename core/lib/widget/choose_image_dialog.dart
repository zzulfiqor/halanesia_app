import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ChooseImageDialog extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onClicked;
  final double horizontalPadding;

  const ChooseImageDialog(
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
      splashColor: secondary,
      child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10),
          child: Row(
            children: [
              loadImageAssetSquare(image, 20),
              const SizedBox(width: 25),
              Text(title, style: header.copyWith(color: basic))
            ],
          )),
    );
  }
}
