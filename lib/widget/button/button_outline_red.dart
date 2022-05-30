import 'package:flutter/material.dart';
import '../../theme.dart';

class ButtonOutlineRed extends StatelessWidget {

  final String? text;
  final VoidCallback? onPressed;

  const ButtonOutlineRed({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed, 
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(text!, 
          style: buttonTextStyle3
        ),
      ),
      style: buttonOutlineRed
      )
    );
  }
}