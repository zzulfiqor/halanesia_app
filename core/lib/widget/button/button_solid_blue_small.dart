import 'package:flutter/material.dart';
import '../../core.dart';

class ButtonSolidBlueSmall extends StatelessWidget {

  final String? text;
  final VoidCallback? onPressed;
  final double? width;

  const ButtonSolidBlueSmall({Key? key, this.text, this.onPressed, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    height: 26, 
    width: width,
    child: ElevatedButton(
      onPressed: onPressed, 
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(text!, 
          style: buttonTextStyle1.copyWith(fontSize: 14)
        ),
      ),
      style: buttonSolidBlue
      )
    );
  }
}