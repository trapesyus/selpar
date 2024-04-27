import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/elevated_button_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_button_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

class HesapScreen extends StatelessWidget {
  const HesapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          _profilePhoto(context),
          _profileTextButton(),
          _name(),
          _surName(),
          _phone(),
          _saveButton()
        ],
      ).getPadding(context: context, sizeWidth: 0.04, sizeHeight: 0.02),
    ));
  }

  CustomAppBar _appBar(BuildContext context) {
    return CustomAppBar(
      leading: CustomIconButton(
          icon: const Icon(CupertinoIcons.back,
              color: ColorConstants.buttonColor),
          onPressed: () => Navigator.of(context).pop()),
      title: 'Hesap',
      titleStyle: true,
      centerTitle: false,
    );
  }

  SizedBox _profilePhoto(BuildContext context) {
    return SizedBox(
      height: context.getSizeHeight(size: 0.2),
      width: context.getSizeWidth(size: 0.8),
      child:
          const CircleAvatar().getPaddingOnly(context: context, bottom: 0.02),
    );
  }

  CustomElevatedButton _saveButton() {
    return CustomElevatedButton(
        buttonText: LanguageService.choosenLanguage['key']!.kaydet!,
        onPressed: () {});
  }

  CustomTextField _phone() {
    return CustomTextField(
      controller: null,
      sizeBottom: 0.02,
      verticalHeight: 0.01,
      horizontalHeight: 0.04,
      label: 'Telefon',
      labelStyle: true,
    );
  }

  CustomTextField _surName() {
    return CustomTextField(
      controller: null,
      sizeBottom: 0.02,
      verticalHeight: 0.01,
      horizontalHeight: 0.04,
      label: 'Soyadınız',
      labelStyle: true,
    );
  }

  CustomTextField _name() {
    return CustomTextField(
      controller: null,
      sizeTop: 0.02,
      sizeBottom: 0.02,
      verticalHeight: 0.01,
      horizontalHeight: 0.04,
      label: 'Adınız',
      labelStyle: true,
    );
  }

  CustomTextButton _profileTextButton() {
    return CustomTextButton(
        text: 'Profil Fotoğrafı',
        isBold: true,
        onPressed: () {},
        color: ColorConstants.defaultTextColor);
  }
}
