import 'package:flutter/material.dart';

class FadingEffectPainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height));
    Paint paint = Paint()..shader = const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(0, 255, 255, 255)
        ]).createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(FadingEffectPainer linePainter) => false;
}