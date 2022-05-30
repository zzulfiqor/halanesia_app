import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ProfileTextFieldDisable extends StatelessWidget {

  final String title;
  final String hint;
  final TextEditingController controller;
  final FormFieldSetter<String>? onSaved;

  const ProfileTextFieldDisable({ Key? key, this.title = "", this.hint = "", required this.controller, this.onSaved }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: info1.copyWith(color: darkGrey)
        ),
        Container(
          padding: const EdgeInsets.only(top: 6),
          child: IgnorePointer(
            child: Stack(
              children: [
                TextFormField(
                  controller: controller,
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  style: bodyText,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: hint,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    contentPadding: const EdgeInsets.only(left: 12, right: 40, top: 8, bottom: 8),
                  ),
                  onSaved: onSaved,
                ),
                const Positioned(
                  right: 8,
                  top: 8,
                  child: Icon(
                    Icons.lock_rounded,
                    size: 20,
                    color: darkGrey
                  )
                )
              ],
            ),
          ),
        ),
      ]
    );
  }
}