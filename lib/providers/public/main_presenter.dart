import 'package:almas/config/languages/helpers/language_helper.dart';
import 'package:almas/config/mine_fonts.dart';
import 'package:almas/data-server/shared_preference/shared_preferences.dart';
import 'package:flutter/material.dart';

class MainPresenter with ChangeNotifier {
  String currentLanguage = 'فارسی';
  Locale locale = const Locale('fa');
  String font = MineFonts.nazanin;

  LanguageHelper languageHelper = LanguageHelper();

  Locale get getlocale => locale;

  Future init() async {
    final lang = SharedPreferencesPublic.currentLanguage;

    if (lang != null) {
      locale = languageHelper.convertLangNameToLocale(lang);
    }
  }

  Future<void> changeLocale(String newLocale) async {
    Locale convertedLocale;
    await SharedPreferencesPublic.changeLanguage(newLocale);
    currentLanguage = newLocale;
    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);
    locale = convertedLocale;
    notifyListeners();
  }

  Future<void> changeFont(String? newFont) async {
    if (newFont != null) {
      font = newFont;
      notifyListeners();
    }
  }

  String defineCurrentLanguage(context) {
    String definedCurrentLanguage;

    definedCurrentLanguage = currentLanguage;
    return definedCurrentLanguage;
  }
}
