import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selpar/core/constants/color_constants.dart';

// ignore: must_be_immutable
class CustomLabelText extends StatelessWidget {
  CustomLabelText(
      {super.key,
      required this.label,
      this.isItalic = false,
      this.isBold = false,
      this.isColorNotWhite = false,
      this.color = false,
      this.fontSize = 18});

  String label;
  bool isColorNotWhite;
  bool color;
  bool isItalic;
  bool isBold;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontStyle: isItalic ? FontStyle.italic : null,
          fontFamily: GoogleFonts.merriweather().fontFamily,
          fontSize: fontSize,
          // fontFamily: GoogleFonts.merriweather().fontFamily,
          color: isColorNotWhite
              ? ColorConstants.bgColor
              : ColorConstants.whiteColor,
          fontWeight: FontWeight.bold),
    );
  }
}