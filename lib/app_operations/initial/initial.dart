import 'package:shared_preferences/shared_preferences.dart';

import '../../service/language/language_service/language_service.dart';

class Initial {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static Future<void> initialize() async {
    LanguageService languageService = LanguageService();
    await languageService.getLanguage();
  }
}
