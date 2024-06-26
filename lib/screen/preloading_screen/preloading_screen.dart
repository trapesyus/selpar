import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/constants/color_constants.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/widgets/appbar_widget.dart';
import 'package:selpar/core/widgets/elevated_button_widget.dart';
import 'package:selpar/core/widgets/progress_indicator.dart';
import 'package:selpar/core/widgets/text_widget.dart';
import 'package:selpar/core/widgets/title_text_widget.dart';
import 'package:selpar/screen/language_screen/language_screen.dart';
import 'package:selpar/screen/login_screen/login_screen.dart';
import 'package:selpar/screen/preloading_screen/preloading_screen_model/preloading_screen_model.dart';
import 'package:selpar/screen/signup_screen/signup_screen.dart';
import 'package:selpar/service/language/language_service/language_service.dart';

import '../../core/widgets/icon_button_widget.dart';

class PreloadingScreen extends StatelessWidget {
  PreloadingScreen({super.key}) {
    reaction((_) async => await _preloadingScreenModel.initialize(), (_) {});
  }
  final PreloadingScreenModel _preloadingScreenModel = PreloadingScreenModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: Observer(builder: (context) {
          return _preloadingScreenModel.isInitial
              ? Column(
                  children: [
                    Expanded(flex: 2, child: _lottieSplash()),
                    Expanded(child: _appTitleSlogan()),
                    Expanded(child: _logInSignUp(context))
                  ],
                )
              : const CustomCircularProgress();
        }),
      ),
    );
  }

  Column _logInSignUp(BuildContext context) => Column(
        children: [_logIn(context), _signUp(context)],
      );

  TextButton _signUp(BuildContext context) => TextButton(
      onPressed: () => SignUpScreen().navigateEffectiveTo(context: context),
      child: CustomText(
        text: LanguageService.choosenLanguage['key']!.kaydol!,
        color: ColorConstants.defaultTextColor,
        isBold: true,
        fontSize: 16,
      ));

  CustomElevatedButton _logIn(BuildContext context) => CustomElevatedButton(
      buttonText: LanguageService.choosenLanguage['key']!.girisYap!,
      onPressed: () =>
          const LoginScreen().navigateEffectiveTo(context: context));

  CustomAppBar _appBar(BuildContext context) => CustomAppBar(
        leading: const SizedBox(),
        actions: [
          CustomIconButton(
            icon: const Icon(
              Icons.language,
              color: ColorConstants.buttonColor,
              size: 28,
            ),
            onPressed: () async =>
                await LanguageScreen(isPreloadingScreen: true)
                    .navigateEffectiveTo(context: context),
          ),
        ],
      );

  ListTile _appTitleSlogan() => ListTile(
        title: CustomTitleText(
          title: 'Selpar',
          color: ColorConstants.textButtonColor,
        ),
        subtitle: CustomText(
            text: LanguageService.choosenLanguage['key']!.slogan!,
            color: ColorConstants.defaultTextColor),
      );

  LottieBuilder _lottieSplash() => Lottie.asset('assets/lottie/splash.json');
}
