import 'package:flutter/material.dart';

import '../../core.dart';

class ButtonOutlineBlueMedium extends StatelessWidget {

  final String? text;
  final VoidCallback? onPressed;

  const ButtonOutlineBlueMedium({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    height: 36, 
    child: ElevatedButton(
      onPressed: onPressed, 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(text!, 
          style: buttonTextStyle2.copyWith(fontSize: 14)
        ),
      ),
      style: buttonOutlineBlue
      )
    );
  }
}