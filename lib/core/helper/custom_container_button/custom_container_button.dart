import 'package:flutter/material.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import '../../constants/color_constants.dart';
import '../../widgets/text_widget.dart';

// ignore: must_be_immutable
class CustomContainerButton extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  const CustomContainerButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.getSizeHeight(size: 0.05),
        width: context.getSizeWidth(size: 0.2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstants.buttonColor),
        child: CustomText(
            text: buttonText, color: ColorConstants.whiteColor, isBold: true),
      ),
    );
  }
}
