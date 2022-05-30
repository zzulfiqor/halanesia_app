import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FabToTop extends StatelessWidget {
  final Function() onTap;
  const FabToTop({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundGrey,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: 45,
        width: 45,
        child: Image.asset('assets/images/fab_back_to_top.png'),
      ),
    );
  }
}
