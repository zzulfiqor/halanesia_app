import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class QuotationTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int minLines;
  final int? maxLines;
  final double? formHeight;
  final bool isCurrency;

  const QuotationTextField({
    Key? key,
    this.title = "",
    required this.controller,
    required this.onSaved,
    required this.validator,
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.minLines = 1,
    this.maxLines = 1,
    this.isCurrency = false,
    this.formHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: info1.copyWith(color: darkGrey)),
      Container(
        padding: const EdgeInsets.only(top: 6),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          keyboardType: keyboardType,
          autocorrect: false,
          maxLines: maxLines,
          minLines: minLines,
          textAlignVertical: TextAlignVertical.center,
          style: bodyText,
          decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: darkGrey)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: bad)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: secondary)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          onSaved: onSaved,
          validator: validator,
          inputFormatters: isCurrency
              ? <TextInputFormatter>[
                  CurrencyTextInputFormatter(
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  )
                ]
              : <TextInputFormatter>[],
        ),
      ),
    ]);
  }
}
