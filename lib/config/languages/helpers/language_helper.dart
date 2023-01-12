import 'package:flutter/material.dart';

class LanguageHelper {
  Locale convertLangNameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert) {
      case 'English':
        convertedLocale = const Locale('en', 'EN');
        break;
      case 'فارسی':
        convertedLocale = const Locale('fa', 'IR');
        break;
      case 'Français':
        convertedLocale = const Locale('fr', 'FR');
        break;
      case 'Español':
        convertedLocale = const Locale('es', 'ES');
        break;
      case 'Русский':
        convertedLocale = const Locale('ru', 'RU');
        break;
      default:
        convertedLocale = const Locale('en', 'EN');
    }

    return convertedLocale;
  }

  String convertLocaleToLangName(String localeToConvert) {
    String langName;

    switch (localeToConvert) {
      case 'en':
        langName = "English";
        break;
      case 'fa':
        langName = "فارسی";
        break;
      case 'fr':
        langName = "Français";
        break;
      case 'es':
        langName = "Español";
        break;
      case 'ru':
        langName = "Русский";
        break;
      default:
        langName = "English";
    }

    return langName;
  }
}
