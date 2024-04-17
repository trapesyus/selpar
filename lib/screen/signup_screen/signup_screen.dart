import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/extensions/size_extension.dart';
import 'package:selpar/core/helper/custom_dropdown_button/custom_dropdown_button.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/textfield_widget.dart';
import 'package:selpar/screen/login_screen/login_screen.dart';
import 'package:selpar/screen/signup_screen/signup_screen_model/signup_screen_model.dart';

import '../../core/constants/color_constants.dart';
import '../../core/widgets/bottom_navbar_widget/bottom_navbar_widget.dart';
import '../../core/widgets/elevated_button_widget.dart';
import '../../core/widgets/text_widget.dart';
import '../../core/widgets/title_text_widget.dart';
import '../../service/language/language_service/language_service.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final SignUpScreenModel _signUpScreenModel = SignUpScreenModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        backgroundColor: Colors.transparent,
        leading: CustomIconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: ColorConstants.buttonColor,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          CustomTitleText(
            title: LanguageService.choosenLanguage['key']!.kaydol!,
            color: ColorConstants.textButtonColor,
          ),
          CustomTextField(
            controller: null,
            verticalHeight: 0.01,
            horizontalHeight: 0.04,
            sizeLeft: 0.02,
            sizeBottom: 0.02,
            sizeRight: 0.02,
            sizeTop: 0.04,
            label: LanguageService.choosenLanguage['key']!.firmaAdi,
            labelStyle: true,
          ),
          CustomTextField(
            controller: null,
            verticalHeight: 0.01,
            horizontalHeight: 0.04,
            sizeLeft: 0.02,
            sizeRight: 0.02,
            label: LanguageService.choosenLanguage['key']!.yetkiliAdSoyad,
            labelStyle: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: context.getSizeWidth(size: 0.42),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorConstants.textFieldHintTextColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: CustomDropDownbutton(
                      items: _signUpScreenModel.provinceItems)),
              Container(
                  width: context.getSizeWidth(size: 0.42),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorConstants.textFieldHintTextColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: CustomDropDownbutton(
                      items: _signUpScreenModel.districtItems)),
            ],
          ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
          CustomTextField(
            controller: null,
            verticalHeight: 0.01,
            horizontalHeight: 0.04,
            sizeTop: 0.02,
            sizeLeft: 0.02,
            sizeRight: 0.02,
            label: LanguageService.choosenLanguage['key']!.adres,
            labelStyle: true,
          ),
          CustomTextField(
            controller: null,
            verticalHeight: 0.01,
            horizontalHeight: 0.04,
            sizeLeft: 0.02,
            sizeRight: 0.02,
            label: LanguageService.choosenLanguage['key']!.telefon,
            labelStyle: true,
          ),
          Container(
                  width: context.getSizeWidth(size: 0.42),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: ColorConstants.textFieldHintTextColor),
                      borderRadius: BorderRadius.circular(20)),
                  child: CustomDropDownbutton(
                      items: _signUpScreenModel.servicesItems))
              .getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
          CustomTextField(
            controller: null,
            verticalHeight: 0.01,
            horizontalHeight: 0.04,
            sizeLeft: 0.02,
            sizeRight: 0.02,
            sizeTop: 0.02,
            label: LanguageService.choosenLanguage['key']!.mail,
            labelStyle: true,
          ),
          CustomTextField(
            controller: null,
            verticalHeight: 0.01,
            horizontalHeight: 0.04,
            sizeLeft: 0.02,
            sizeRight: 0.02,
            label: 'Şifre',
            labelStyle: true,
            passwordType: true,
          ),
          CustomElevatedButton(
                  buttonText: LanguageService.choosenLanguage['key']!.kaydol!,
                  onPressed: () => BottomNavbarWidget()
                      .navigateEffectiveToPushReplacement(context: context))
              .getPaddingOnly(
                  context: context,
                  bottom: 0.02,
                  left: 0.02,
                  right: 0.02,
                  top: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                  text: LanguageService.choosenLanguage['key']!.anyAccount!,
                  color: ColorConstants.defaultTextColor,
                  fontSize: 10),
              GestureDetector(
                  onTap: () =>
                      const LoginScreen().navigateEffectiveTo(context: context),
                  child: CustomText(
                    text:
                        ' ${LanguageService.choosenLanguage['key']!.girisYap!}',
                    color: ColorConstants.defaultTextColor,
                    fontSize: 10,
                    isBold: true,
                  ))
            ],
          )
        ],
      ).getPadding(context: context, sizeWidth: 0.04, sizeHeight: 0),
    ));
  }
}
