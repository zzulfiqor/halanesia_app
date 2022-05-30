import 'package:core/core.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  final Widget? child;
  final String? title;
  final Function()? onTap;

  const HomeMenu({
    Key? key,
    required this.child,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: backgroundGrey,
            ),
            child: SizedBox(
              height: 32,
              width: 32,
              child: child,
            ),
          ),

          // Title
          const SizedBox(height: 10),
          SizedBox(
            width: 75,
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: info1.copyWith(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
