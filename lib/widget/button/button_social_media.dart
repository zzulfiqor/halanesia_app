import 'package:flutter/material.dart';
import '../../theme.dart';

class ButtonSocialMedia extends StatelessWidget {

  final String? text;
  final String? icon;
  final VoidCallback? onPressed;

  const ButtonSocialMedia({Key? key, this.text, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    height: 57,
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed, 
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(text!, 
                style: buttonTextStyle3
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Image.asset(icon!,
                height: 24,
                width: 24,
              ),
            ),
          ],
        )
      ),
      style: buttonOutlineGray
      )
    );
  }
}