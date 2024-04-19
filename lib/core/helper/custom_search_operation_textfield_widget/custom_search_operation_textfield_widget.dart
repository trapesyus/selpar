import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

// ignore: must_be_immutable
class CustomSearchOperationTextFieldWidget extends StatelessWidget {
  Widget? child;
  String pageTitle;

  Function() onTapTextField;
  CustomSearchOperationTextFieldWidget(
      {super.key,
      this.child,
      required this.pageTitle,
      required this.onTapTextField});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            title: pageTitle,
            titleStyle: true,
            centerTitle: false,
            leading: CustomIconButton(
                icon: const Icon(CupertinoIcons.back,
                    color: ColorConstants.textButtonColor),
                onPressed: () => Navigator.of(context).pop())),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            CustomTextField(
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
            ).getPaddingOnly(context: context, left: 0.02, right: 0.02),
            child != null ? child! : const SizedBox(),
          ],
        ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
      ),
    );
  }
}
