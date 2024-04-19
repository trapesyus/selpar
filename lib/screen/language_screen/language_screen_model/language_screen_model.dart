import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:selpar/core/extensions/navigate_effective_extension.dart';
import 'package:selpar/core/extensions/snackbar_extension.dart';
import 'package:selpar/core/helper/custom_progress_lottie/custom_progress_lottie.dart';
import 'package:selpar/screen/preloading_screen/preloading_screen.dart';
import 'package:selpar/service/language/language_service/language_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/widgets/bottom_navbar_widget/bottom_navbar_widget.dart';
part 'language_screen_model.g.dart';

class LanguageScreenModel = _LanguageScreenModelBase with _$LanguageScreenModel;

abstract class _LanguageScreenModelBase with Store {
  @observable
  String selectedLanguage = '';
  @observable
  bool isSelectedLanguage = false;

  Future<void> initialize() async {
    await getLanguage().whenComplete(() => isSelectedLanguage = true);
  }

  Future<void> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    selectedLanguage = prefs.getString('language')!.isNotEmpty
        ? prefs.getString('language')! == 'en'
            ? LanguageService.choosenLanguage['key']!.ingilizce!
            : prefs.getString('language')! == 'de'
                ? LanguageService.choosenLanguage['key']!.almanca!
                : prefs.getString('language')! == 'flemish'
                    ? LanguageService.choosenLanguage['key']!.flemenkce!
                    : prefs.getString('language')! == 'ru'
                        ? LanguageService.choosenLanguage['key']!.rusca!
                        : LanguageService.choosenLanguage['key']!.turkce!
        : LanguageService.choosenLanguage['key']!.turkce!;
  }

  @action
  Future<void> setSelectedLanguage(
      {required String language,
      required BuildContext context,
      required bool isPreloadingScreen}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (language == LanguageService.choosenLanguage['key']!.turkce!) {
      await prefs.setString('language', 'tr').then((value) async =>
          await navigateOperation(
              context: context, isPreloadingScreen: isPreloadingScreen));
    } else if (language == LanguageService.choosenLanguage['key']!.ingilizce!) {
      await prefs.setString('language', 'en').then((value) async =>
          await navigateOperation(
              context: context, isPreloadingScreen: isPreloadingScreen));
    } else if (language == LanguageService.choosenLanguage['key']!.almanca!) {
      await prefs.setString('language', 'de').whenComplete(() async =>
          await navigateOperation(
              context: context, isPreloadingScreen: isPreloadingScreen));
    } else if (language == LanguageService.choosenLanguage['key']!.rusca!) {
      await prefs.setString('language', 'ru').whenComplete(() async =>
          await navigateOperation(
              context: context, isPreloadingScreen: isPreloadingScreen));
    } else if (language == LanguageService.choosenLanguage['key']!.flemenkce!) {
      await prefs.setString('language', 'flemish').whenComplete(() async =>
          await navigateOperation(
              context: context, isPreloadingScreen: isPreloadingScreen));
    }
  }

  Future<void> navigateOperation(
      {required BuildContext context, required bool isPreloadingScreen}) async {
    log('buraya girdi');

    await CustomProgressLottie(
            context: context,
            widget:
                isPreloadingScreen ? PreloadingScreen() : BottomNavbarWidget())
        .navigateEffectiveTo(context: context)
        .whenComplete(() => context.snackBarExtension(
            content: LanguageService
                .choosenLanguage['key']!.dilSecimiBasariylaGerceklestirildi!));
  }
}
