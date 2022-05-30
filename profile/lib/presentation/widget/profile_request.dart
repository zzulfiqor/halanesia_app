import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/presentation/widget/note_tag.dart';

class ProfileRequest extends StatelessWidget {

  final String name;
  final String image;
  final int day;
  final String request;
  final int price;

  const ProfileRequest({Key? key, required this.name, required this.image, required this.day, required this.request, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Material(
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: title3.copyWith(color: secondary),
                    ),
                  ),
                  NoteTag(title: "Berakhir Dalam: $day Hari"),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  loadImageProfile(image, 50),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          request,
                          style: info1
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Anggaran: ",
                                style: info1.copyWith(color: darkGrey)
                              ), 
                              TextSpan(
                                text: formatCurrencyWithDecimal(price),
                                style: info1.copyWith(color: good),
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}