import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ProfileValueItem extends StatelessWidget {

  final String title;
  final String value;

  const ProfileValueItem({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 120,
              child: Text(
                title,
                style: bodyText.copyWith(color: darkGrey)
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                value,
                style: bodyText.copyWith(color: basic)
              ),
            )
          ],
        ),
        const Divider(
          color: neutralGrey
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}