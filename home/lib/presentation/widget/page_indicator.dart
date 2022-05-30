import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int totalPages;
  final int currentIndex;

  const PageIndicator(
      {Key? key, required this.totalPages, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(totalPages, (int index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? secondary : neutralGrey,
          ),
        );
      }),
    );
  }
}
