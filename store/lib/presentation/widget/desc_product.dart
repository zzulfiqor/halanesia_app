import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DescProduct extends StatelessWidget {

  final String title;
  final String value;
  final bool isHighlight;

  const DescProduct({ Key? key, required this.title, required this.value, this.isHighlight = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: subTitle3.copyWith(color: darkGrey)
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                value,
                style: isHighlight ? secondary3Bold.copyWith(fontSize: 14, color: secondary) : subTitle3.copyWith(color: basic)
              ),
            )
          ],
        ),
        const Divider(
          color: neutralGrey
        ),
      ],
    );
  }
}