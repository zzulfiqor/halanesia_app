import 'package:flutter/material.dart';

import '../../core.dart';

class ButtonOutlineBlue extends StatelessWidget {

  final String? text;
  final VoidCallback? onPressed;

  const ButtonOutlineBlue({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    height: 46, 
    child: ElevatedButton(
      onPressed: onPressed, 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Text(text!, 
          style: buttonTextStyle2.copyWith(fontSize: 18)
        ),
      ),
      style: buttonOutlineBlue
      )
    );
  }
}