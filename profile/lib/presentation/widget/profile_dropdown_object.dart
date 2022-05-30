import 'package:core/core.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class ProfileDropdownObject extends StatelessWidget {

  final String title;
  final String hint;
  final List<dynamic>? items;
  final String Function(dynamic)? itemAsString;
  final String showItem;
  final FormFieldSetter<dynamic>? onSaved;
  final FormFieldValidator<dynamic>? validator;

  const ProfileDropdownObject({ Key? key, this.title = "", required this.onSaved, required  this.validator, this.hint = "", this.items, this.itemAsString, required this.showItem, }) : super(key: key);

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
          child: DropdownSearch<dynamic>(
            mode: Mode.MENU,
            items: items,
            dropdownSearchDecoration: dropdownDecoration.copyWith(
              hintText: hint),
            itemAsString: itemAsString,
            popupItemBuilder: (context, item, isSelected) => 
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  item,
                  style: bodyText,
              ),
            ),
            onSaved: onSaved,
            validator: validator,
          ),
        ),
      ]
    );
  }
}