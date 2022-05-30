import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightBlue = Color(0xFF1073A8);
const Color white = Colors.white;
const Color lightYellow = Color(0xFFFFDF00);
const Color darkYellow = Color(0xFFFEC600);
const Color green = Color(0xFF3FC380);
const Color red = Color(0xFFF64747);
const Color lightGrey = Color(0xFFBBBBBB);
const Color darkGrey = Color(0xFF707070);
const Color black = Color(0xFF000000);


TextStyle pageTitle = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 20,
  color: black,
);
TextStyle title1 = GoogleFonts.roboto(
  fontWeight: FontWeight.w700,
  fontSize: 24,
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
  color: lightBlue
);

TextStyle buttonTextStyle3 = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: lightGrey
);

TextStyle textButtonBlue = GoogleFonts.roboto(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: lightBlue,
);

TextStyle textSmallPreview = GoogleFonts.roboto(
  fontWeight: FontWeight.w400,
  fontSize: 11,
  color:lightGrey,
);


ButtonStyle buttonSolidBlue = ElevatedButton.styleFrom(
  primary: lightBlue,
  shape: roundShape);

ButtonStyle buttonOutlineBlue = ElevatedButton.styleFrom(
  primary: white,
  shape: roundShape.copyWith(side: const BorderSide(color: lightBlue, width: 1.0,))
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


