import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ProfileTime extends StatelessWidget {

  final String title;
  final String time;
  final VoidCallback onPressed;

  const ProfileTime({ Key? key, required this.title, required this.time, required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: header.copyWith(color: basic)
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: onPressed,
          child: Container(
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: neutralGrey)
            ),
            child: Row(
              children: [
                const SizedBox(width: 12,),
                Expanded(
                  child: Text(time,
                    style: bodyText
                  )
                ),
                loadImageAssetSquare("assets/images/chevron_bottom.png", 40),
                const SizedBox(width: 12,)
              ],
            )
          ),
        )
      ],
    );
  }
}