import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/elevated_button_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class HesapScreen extends StatelessWidget {
  const HesapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
            icon: const Icon(CupertinoIcons.back,
                color: ColorConstants.buttonColor),
            onPressed: () => Navigator.of(context).pop()),
        title: 'Hesap',
        titleStyle: true,
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.getSizeHeight(size: 0.2),
            width: context.getSizeWidth(size: 0.8),
            child: const CircleAvatar()
                .getPaddingOnly(context: context, bottom: 0.02),
          ),
          CustomTextButton(
              text: 'Profil Fotoğrafı',
              isBold: true,
              onPressed: () {},
              color: ColorConstants.defaultTextColor),
          CustomTextField(
            controller: null,
            sizeTop: 0.02,
            sizeBottom: 0.02,
            verticalHeight: 0.01,
            horizontalHeight: 0.04,
            label: 'Adınız',
            labelStyle: true,
          ),
          CustomTextField(
            controller: null,
            sizeBottom: 0.02,
            verticalHeight: 0.01,
            horizontalHeight: 0.04,
            label: 'Soyadınız',
            labelStyle: true,
          ),
          CustomTextField(
            controller: null,
            sizeBottom: 0.02,
            verticalHeight: 0.01,
            horizontalHeight: 0.04,
            label: 'Telefon',
            labelStyle: true,
          ),
          CustomElevatedButton(
              buttonText: LanguageService.choosenLanguage['key']!.kaydet!,
              onPressed: () {})
        ],
      ).getPadding(context: context, sizeWidth: 0.04, sizeHeight: 0.02),
    ));
  }
}
