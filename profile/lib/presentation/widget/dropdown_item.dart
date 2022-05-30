import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DropdownItem extends StatelessWidget {

  final String item;

  const DropdownItem({ Key? key, required this.item }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        item,
        style: bodyText,
        maxLines: 1,
      )
    );
  }
}