import 'package:core/core.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dropdown_item.dart';

class ProfileDropdownString extends StatelessWidget {

  final String title;
  final String hint;
  final List<String>? items;
  final String? selectedItem;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final bool isLoading;

  const ProfileDropdownString({ Key? key, this.title = "", required this.onSaved, required  this.validator, this.hint = "", this.items, this.selectedItem = null, this.isLoading = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: info1.copyWith(color: darkGrey)
            ),
            const SizedBox(height: 6),
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItems: selectedItem==null ? false : true,
              items: items,
              selectedItem: selectedItem,
              dropDownButton: loadImageAssetSquare("assets/images/chevron_bottom.png", 30),
              dropdownSearchDecoration: dropdownDecoration.copyWith(
                    hintText: isLoading ? "" : hint),
              itemAsString: (item) => item!,
              popupItemBuilder: (context, item, isSelected) => 
                DropdownItem(item: item),
              onSaved: onSaved,
              validator: validator,
            ),
          ]
        ),
        isLoading ? const Positioned(
          left: 10,
          top: 25,
          child: SpinKitFadingCircle(
            color: secondary,
            size: 26.0,)
        ) : Container()
      ],
    );
  }
}