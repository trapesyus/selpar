import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';

import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/widgets/text_widget.dart';

import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

// ignore: must_be_immutable
class CustomSearchOperationTextFieldWithoutScaffoldWidget
    extends StatelessWidget {
  Widget? child;
  String pageTitle;

  Function() onTapTextField;
  CustomSearchOperationTextFieldWithoutScaffoldWidget(
      {super.key,
      this.child,
      required this.pageTitle,
      required this.onTapTextField});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        _pageTitle(),
        _search().getPaddingOnly(context: context, left: 0.02, right: 0.02),
        child != null ? child! : const SizedBox(),
      ],
    ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0);
  }

  CustomText _pageTitle() => CustomText(
      text: pageTitle,
      fontSize: 16,
      isBold: true,
      color: ColorConstants.defaultTextColor);

  CustomTextField _search() => CustomTextField(
        horizontalHeight: 0.04,
        verticalHeight: 0.01,
        sizeLeft: 0.02,
        sizeRight: 0.02,
        sizeTop: 0.02,
        sizeBottom: 0.02,
        label: LanguageService.choosenLanguage['key']!.plakaCariVsArama!,
        labelStyle: true,
        isIconOnTap: onTapTextField,
        isIcon: true,
        isIconTap: true,
      );
}
