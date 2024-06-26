import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/constants/images_login_signup_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/padding_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/bottom_navbar_widget/bottom_navbar_widget.dart';
import 'package:selpar/core/widgets/custom_account_textfield.dart';
import 'package:selpar/core/widgets/elevated_button_widget.dart';
import 'package:selpar/core/widgets/icon_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/title_text_widget.dart';
import 'package:selpar/screen/signup_screen/signup_screen.dart';

import '../../service/language/language_service/language_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(context),
      body: ListView(
        children: [
          _pageName(),
          _mail(),
          _password(),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: TextButton(
          //       onPressed: () {},
          //       child: CustomText(
          //         text: 'Şifremi Unuttum?',
          //         fontSize: 10,
          //         color: ColorConstants.defaultTextColor,
          //       )),
          // ),
          _logIn(context).getPaddingOnly(
              context: context, bottom: 0.3, right: 0.02, left: 0.02),
          _routeSignUpPage(context)
        ],
      ).getPadding(context: context, sizeWidth: 0.04, sizeHeight: 0),
    ));
  }

  Row _routeSignUpPage(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
              text: '${LanguageService.choosenLanguage['key']!.hesabinYokMu!} ',
              color: ColorConstants.defaultTextColor,
              fontSize: 10),
          GestureDetector(
              onTap: () => SignUpScreen().navigateEffectiveTo(context: context),
              child: CustomText(
                text: LanguageService.choosenLanguage['key']!.kaydol!,
                color: ColorConstants.defaultTextColor,
                fontSize: 10,
                isBold: true,
              ))
        ],
      );

  CustomElevatedButton _logIn(BuildContext context) => CustomElevatedButton(
      buttonText: LanguageService.choosenLanguage['key']!.girisYap!,
      onPressed: () => BottomNavbarWidget()
          .navigateEffectiveToPushReplacement(context: context));

  CustomAccountTextfield _password() => CustomAccountTextfield(
        controller: null,
        verticalHeight: 0.02,
        horizontalHeight: 0.02,
        sizeLeft: 0.02,
        sizeRight: 0.02,
        isPrefixIcon: true,
        prefixImage: ImagesLoginSignUpConstants.passwordImage,
        label: LanguageService.choosenLanguage['key']!.sifre!,
        labelStyle: true,
        passwordType: true,
      );

  CustomAccountTextfield _mail() => CustomAccountTextfield(
        controller: null,
        verticalHeight: 0.02,
        horizontalHeight: 0.02,
        sizeLeft: 0.02,
        sizeBottom: 0.02,
        sizeRight: 0.02,
        sizeTop: 0.2,
        isPrefixIcon: true,
        prefixImage: ImagesLoginSignUpConstants.mailImage,
        label: LanguageService.choosenLanguage['key']!.mail!,
        labelStyle: true,
      );

  CustomTitleText _pageName() => CustomTitleText(
        title: LanguageService.choosenLanguage['key']!.girisYap!,
        color: ColorConstants.textButtonColor,
      );

  CustomAppBar _appBar(BuildContext context) => CustomAppBar(
        leading: CustomIconButton(
            icon: const Icon(CupertinoIcons.back,
                color: ColorConstants.buttonColor),
            onPressed: () => Navigator.of(context).pop()),
      );
}
