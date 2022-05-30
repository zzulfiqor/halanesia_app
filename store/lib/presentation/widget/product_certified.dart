import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ProductCertified extends StatelessWidget {

  final Color color;
  final String text;

  const ProductCertified({ Key? key, required this.color, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline_rounded,
              size: 24,
              color: white,
            ),
            const SizedBox(width: 20),
            Text(text,
              style: header.copyWith(color: white)
            )
          ]
        ),
      )
    );
  }
}