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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        leading: CustomIconButton(
            icon: const Icon(CupertinoIcons.back,
                color: ColorConstants.buttonColor),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: ListView(
        children: [
          CustomTitleText(
            title: 'Giriş Yap',
            color: ColorConstants.textButtonColor,
          ),
          CustomAccountTextfield(
            controller: null,
            verticalHeight: 0.02,
            horizontalHeight: 0.02,
            sizeLeft: 0.02,
            sizeBottom: 0.02,
            sizeRight: 0.02,
            sizeTop: 0.1,
            isPrefixIcon: true,
            prefixImage: ImagesLoginSignUpConstants.mailImage,
            label: 'E-Mail',
            labelStyle: true,
          ),
          CustomAccountTextfield(
            controller: null,
            verticalHeight: 0.02,
            horizontalHeight: 0.02,
            sizeLeft: 0.02,
            sizeRight: 0.02,
            isPrefixIcon: true,
            prefixImage: ImagesLoginSignUpConstants.passwordImage,
            label: 'Şifre',
            labelStyle: true,
            passwordType: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: CustomText(
                  text: 'Şifremi Unuttum?',
                  fontSize: 10,
                  color: ColorConstants.defaultTextColor,
                )),
          ),
          CustomElevatedButton(
                  buttonText: 'Giriş Yap',
                  onPressed: () => BottomNavbarWidget()
                      .navigateEffectiveToPushReplacement(context: context))
              .getPaddingOnly(
                  context: context, bottom: 0.4, right: 0.02, left: 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                  text: 'Hesabın yok mu? ',
                  color: ColorConstants.defaultTextColor,
                  fontSize: 10),
              GestureDetector(
                  onTap: () =>
                      SignUpScreen().navigateEffectiveTo(context: context),
                  child: CustomText(
                    text: 'Kayıt Ol',
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
