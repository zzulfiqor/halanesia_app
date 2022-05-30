import 'package:core/core.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../data/response/shipping_location_data.dart';
import 'dropdown_item.dart';

class ProfileDropdownLocation extends StatelessWidget {

  final String title;
  final String hint;
  final List<ShippingLocation> items;
  final ShippingLocation? selectedItem;
  final FormFieldSetter<ShippingLocation>? onSaved;
  final FormFieldValidator<ShippingLocation>? validator;
  final ValueChanged<ShippingLocation?>? onChanged;
  final bool isPostcode;
  final bool isLoading;

  const ProfileDropdownLocation({ Key? key, required this.title, required this.hint, required  this.items, this.selectedItem, this.onSaved, this.validator, this.onChanged, this.isPostcode = false, this.isLoading = false }) : super(key: key);

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
            DropdownSearch<ShippingLocation>(
              mode: Mode.MENU,
              items: items,
              enabled: items.isNotEmpty ? true : false,
              selectedItem: selectedItem,
              autoValidateMode: items.isNotEmpty ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
              dropDownButton: loadImageAssetSquare("assets/images/chevron_bottom.png", 30),
              dropdownSearchDecoration: dropdownDecoration.copyWith(
                hintText: isLoading ? "" : hint),
              itemAsString: (item) => isPostcode ? "${item!.postcode}" : "${item!.name}",
              popupItemBuilder: (context, item, isSelected) => 
                DropdownItem(item: isPostcode ? "${item.postcode}" : "${item.name}"),
              validator: validator,
              onChanged: onChanged,
              onSaved: onSaved,
            ),
          ], 
        ),
        isLoading ? Positioned(
          left: 10,
          top: 25,
          child: loadingSmallCircle()
        ) : Container()
      ],
    );
  }
}