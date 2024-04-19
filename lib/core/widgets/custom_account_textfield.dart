// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selpar/core/extensions/size_extension.dart';

import '../constants/color_constants.dart';

class CustomAccountTextfield extends StatelessWidget {
  String? hintText;
  String? suffixText;
  String? label;

  Function? isPrefixIconOnTap;
  bool isPrefixIconTap;
  bool isPrefixIcon;
  bool isSuffixIcon;
  bool isItalic;
  bool labelStyle;
  bool fillColor;
  bool suffixStyle;
  bool hintTextStyle;
  bool passwordType;
  bool isBold;
  bool isUnderline;

  double fontSize;
  double sizeTop;
  double sizeBottom;
  double sizeLeft;
  double sizeRight;
  int inputFormatters;
  bool textAlignCenter;
  double verticalHeight;
  double horizontalHeight;
  String prefixImage;
  String suffixImage;
  Function()? isSuffixIconOnTap;
  bool isSuffixIconTap;
  TextEditingController? controller;

  CustomAccountTextfield(
      {super.key,
      this.isPrefixIconTap = false,
      this.inputFormatters = 0,
      this.isPrefixIconOnTap,
      this.isPrefixIcon = false,
      this.isUnderline = false,
      this.fontSize = 16,
      this.isSuffixIconOnTap,
      this.isSuffixIconTap = false,
      this.isSuffixIcon = false,
      this.prefixImage = '',
      this.suffixImage = '',
      this.isBold = false,
      this.isItalic = false,
      this.passwordType = false,
      this.controller,
      this.fillColor = false,
      this.hintText,
      this.hintTextStyle = false,
      this.suffixStyle = false,
      this.suffixText,
      this.label,
      this.labelStyle = false,
      this.sizeBottom = 0.016,
      this.sizeLeft = 0,
      this.sizeRight = 0,
      this.sizeTop = 0,
      this.textAlignCenter = false,
      this.verticalHeight = 0.05,
      this.horizontalHeight = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: context.getSizeHeight(size: sizeTop),
            bottom: context.getSizeHeight(size: sizeBottom),
            left: context.getSizeWidth(size: sizeLeft),
            right: context.getSizeWidth(size: sizeRight)),
        child: TextField(
          style: TextStyle(

              // color: Preferences.getThemeCheck()
              //     ? ColorConstants.blackColor
              //     : Colors.white,
              color: ColorConstants.bgColor,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: fontSize,
              decoration: isUnderline ? TextDecoration.underline : null,
              // fontFamily: GoogleFonts.merriweather().fontFamily,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500),
          scrollPhysics: const BouncingScrollPhysics(),
          textAlign: textAlignCenter ? TextAlign.center : TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          controller: controller,
          obscureText: passwordType ? true : false,
          // cursorColor: Preferences.getThemeCheck()
          //     ? ColorConstants.blueColor
          //     : ColorConstants.whiteColor,
          cursorColor: ColorConstants.buttonColor,
          maxLines: 1, // satırın aşağıya devam etmesi için max lines = null,
          inputFormatters: inputFormatters != 0
              ? [LengthLimitingTextInputFormatter(inputFormatters)]
              : null,
          // onChanged: (value) async {
          //   if (isPrefixIconOnTap == null) return;
          //   await isPrefixIconOnTap!();
          // }, //Bu fonksiyon sadece arama ikonuna tıklandığında değil, genel olarak her metinde arama yapması için kullanılıyor.
          keyboardType: TextInputType.multiline,

          decoration: InputDecoration(
              prefixIcon: isPrefixIcon
                  ? GestureDetector(
                      onTap: () => isPrefixIconOnTap!() ?? () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          prefixImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      color: ColorConstants.hintContainerColor, width: 2.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      color: ColorConstants.hintContainerColor, width: 2.0)),
              contentPadding: EdgeInsets.only(
                top: context.getSizeHeight(size: verticalHeight),
                left: context.getSizeWidth(size: horizontalHeight),
                right: context.getSizeWidth(size: horizontalHeight),
                bottom: context.getSizeHeight(size: verticalHeight),
              ),
              alignLabelWithHint: false,
              labelText: label ?? '',
              labelStyle: labelStyle
                  ? TextStyle(
                      color: ColorConstants.textFieldHintTextColor,
                      fontFamily: GoogleFonts.poppins().fontFamily)
                  : null,
              suffixText: suffixText ?? '',
              suffixStyle: TextStyle(
                  color: ColorConstants.whiteColor,
                  fontFamily: GoogleFonts.poppins().fontFamily),
              suffixIcon: isSuffixIcon
                  ? GestureDetector(
                      onTap: () => isPrefixIconOnTap!() ?? () {},
                      child: SvgPicture.asset(suffixImage,
                          fit: BoxFit.cover, height: 24, width: 24),
                    )
                  : null,
              hintStyle: hintTextStyle
                  ? TextStyle(
                      color: ColorConstants.bgColor,
                      fontFamily: GoogleFonts.poppins().fontFamily)
                  : null,
              hintText: hintText ?? '',
              fillColor: fillColor ? ColorConstants.whiteColor : null),
        ));
  }
}
