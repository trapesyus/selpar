import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../widgets/text_widget.dart';

// ignore: must_be_immutable
class CustomPageRouteButton extends StatelessWidget {
  String text;
  Function() onPressed;
  CustomPageRouteButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.buttonColor,
                ),
                child: CustomText(
                    text: text, color: ColorConstants.whiteColor, fontSize: 16),
              ),
            )
          ],
        ),
      ],
    );
  }
}
