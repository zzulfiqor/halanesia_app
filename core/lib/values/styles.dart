import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core.dart';

TextStyle pageTitle = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 20,
  color: black,
);
TextStyle title1 = GoogleFonts.roboto(
  fontWeight: FontWeight.w700,
  fontSize: 22,
  color: black,
);
TextStyle subTitle1 = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 22,
  color: black,
);
TextStyle secondary1 = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 22,
  color: black,
);
TextStyle header = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 18,
  color: black,
);

TextStyle info1 = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: black,
);

TextStyle bodyText = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: black,
);

TextStyle title2 = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: black,
);

TextStyle subTitle2 = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: black,
);

TextStyle secondary2 = GoogleFonts.roboto(
  fontWeight: FontWeight.w300,
  fontSize: 10,
  color: black,
);

TextStyle info2 = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 8,
  color: black,
);

TextStyle info3 = GoogleFonts.roboto(
  fontWeight: FontWeight.w300,
  fontSize: 8,
  color: black,
);

TextStyle title3 = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: black,
);

TextStyle subTitle3 = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: black,
);

TextStyle secondary3 = GoogleFonts.roboto(
  fontWeight: FontWeight.w300,
  fontSize: 12,
  color: black,
  height: 1.6,
);

TextStyle secondary3Bold = GoogleFonts.roboto(
  fontWeight: FontWeight.w700,
  fontSize: 12,
  color: black,
  height: 1.6,
);

TextStyle greyInactiveInput = GoogleFonts.roboto(
  fontWeight: FontWeight.w300,
  fontSize: 16,
  color: lightGrey
);

TextStyle activeInput = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: black
);

TextStyle buttonTextStyle1 = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 16,
);

TextStyle buttonTextStyle2 = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: secondary
);

TextStyle buttonTextStyle3 = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: lightGrey
);

TextStyle textButtonBlue = GoogleFonts.roboto(
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: lightBlue,
);

TextStyle textSmallPreview = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 11,
  color:lightGrey,
);

ButtonStyle buttonSolidBlue = ElevatedButton.styleFrom(
  primary: secondary,
  shape: roundShape);

ButtonStyle buttonOutlineBlue = ElevatedButton.styleFrom(
  primary: white,
  shape: roundShape.copyWith(side: const BorderSide(color: secondary, width: 3.0,))
);

ButtonStyle buttonSolidRed = ElevatedButton.styleFrom(
  primary: red,
  shape: roundShape);

ButtonStyle buttonOutlineRed = ElevatedButton.styleFrom(
  primary: white,
  shape: roundShape.copyWith(side: const BorderSide(color: red, width: 1.0,))
);

ButtonStyle buttonOutlineGray = ElevatedButton.styleFrom(
  primary: white,
  shape: roundShape.copyWith(side: const BorderSide(color: lightGrey, width: 1.0,))
);

RoundedRectangleBorder roundShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));

InputDecoration dropdownDecoration = const InputDecoration(
  isDense: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
  contentPadding: EdgeInsets.only(left: 12, right: -4, top: -6, bottom: -6),
);

