import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_operations/preferences/preferences.dart';
import '../language_model/language_model.dart';

class LanguageService {
  static final LanguageModel languageModel = LanguageModel();
  static Map<String, Tr> choosenLanguage = {'key': LanguageModel().en!};

  Future<void> getLanguage() async {
    SharedPreferences preferences = await Preferences.prefs;
    final Map<String, dynamic> response = jsonDecode(
        await rootBundle.loadString('assets/language/language.json'));
    final LanguageModel languageData = LanguageModel.fromJson(response);

    final String language = preferences.getString('language') ?? 'tr';
    if (language == 'tr') {
      choosenLanguage = {'key': languageData.tr!};
    } else if (language == 'en') {
      choosenLanguage = {'key': languageData.en!};
    } else if (language == 'de') {
      choosenLanguage = {'key': languageData.de!};
    } else if (language == 'ru') {
      choosenLanguage = {'key': languageData.ru!};
    } else if (language == 'flemish') {
      choosenLanguage = {'key': languageData.flemish!};
    }
  }

  static Future<void> setLanguage({required String setLanguage}) async {
    SharedPreferences preferences = await Preferences.prefs;
    await preferences.setString('language', setLanguage);
  }
}
