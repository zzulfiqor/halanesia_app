import 'package:flutter/material.dart';
import '../../core.dart';

class ButtonSolidBlueMedium extends StatelessWidget {

  final String? text;
  final VoidCallback? onPressed;
  final IconData? icon;

  const ButtonSolidBlueMedium({Key? key, this.text, this.onPressed, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    height: 36, 
    child: ElevatedButton(
      onPressed: onPressed, 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null 
            ? Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                icon,
                size: 18,
                color: white))
            : Container(),
            Text(text!, 
              style: buttonTextStyle1.copyWith(fontSize: 14)
            ),
          ],
        ),
      ),
      style: buttonSolidBlue
      )
    );
  }
}