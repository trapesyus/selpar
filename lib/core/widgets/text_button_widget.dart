import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;
  CustomTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = ColorConstants.buttonColor});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text,
          style: TextStyle(
              color: color, fontFamily: GoogleFonts.poppins().fontFamily)),
      onPressed: () => onPressed(),
    );
  }
}
