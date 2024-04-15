import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/elevated_button_widget.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/title_text_widget.dart';
import 'package:selpar/screen/login_screen/login_screen.dart';
import 'package:selpar/screen/signup_screen/signup_screen.dart';

class PreloadingScreen extends StatelessWidget {
  const PreloadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            Expanded(flex: 2, child: Lottie.asset('assets/lottie/splash.json')),
            Expanded(
                child: ListTile(
              title: CustomTitleText(
                title: 'Selpar',
                color: ColorConstants.textButtonColor,
              ),
              subtitle: CustomText(
                  text: 'Buraya slogan yazısı gelecek',
                  color: ColorConstants.defaultTextColor),
            )),
            Expanded(
                child: Column(
              children: [
                CustomElevatedButton(
                    buttonText: 'Giriş Yap',
                    onPressed: () => const LoginScreen()
                        .navigateEffectiveTo(context: context)),
                TextButton(
                    onPressed: () =>
                        SignUpScreen().navigateEffectiveTo(context: context),
                    child: CustomText(
                      text: 'Kaydol',
                      color: ColorConstants.defaultTextColor,
                      isBold: true,
                      fontSize: 16,
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
