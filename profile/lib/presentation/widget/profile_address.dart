import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/presentation/widget/note_tag.dart';

class ProfileAddress extends StatelessWidget {

  final String tag;
  final String name;
  final String phoneNumber;
  final String address;
  final String note;
  final String suburb;
  final String city;
  final String province;
  final String postalCode;
  final bool hasEdit;
  final VoidCallback? onEditClicked;

  const ProfileAddress({Key? key, this.tag = "Alamat Pengiriman", required this.name, required this.phoneNumber, required this.address, required this.note, this.hasEdit = false, this.onEditClicked, required this.suburb, required this.city, required this.province, required this.postalCode,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(12)), 
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NoteTag(title: tag),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$name ",
                    style: secondary3Bold
                  ), 
                  TextSpan(
                    text: "($phoneNumber)",
                    style: secondary3,
                  ),
                ]
              ),
            ),
            Text(
              "$address\n$suburb, $city, $province $postalCode",
              style: secondary3
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Catatan",
                    style: secondary3Bold
                  ), 
                  TextSpan(
                    text: "[$note]",
                    style: secondary3,
                  ),
                ]
              ),
            ),
            hasEdit ? const SizedBox(height: 16) : Container(),
            hasEdit ? GestureDetector(
              onTap: onEditClicked,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Ubah Alamat",
                    style: secondary3Bold.copyWith(color: secondary, fontSize: 14)
                  ),
                  const Icon(Icons.chevron_right_rounded,
                    color: secondary, 
                    size: 20,
                  )
                ],
              ),
            ) : Container()
          ],
        ),
      )
    );
  }
}