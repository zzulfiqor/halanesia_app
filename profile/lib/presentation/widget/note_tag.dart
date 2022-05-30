import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NoteTag extends StatelessWidget {

  final String title;

  const NoteTag({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: note,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        title,
        style: info1.copyWith(color: white)
      )
    );
  }
}