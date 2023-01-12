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
    late String language;

    switch (localeToConvert) {
      case 'en':
        language = "English";
        break;
      case 'fa':
        language = "فارسی";
        break;
      case 'fr':
        language = "Français";
        break;
      case 'es':
        language = "Español";
        break;
      case 'ru':
        language = "Русский";
        break;
      default:
        language = "English";
    }

    return language;
  }
}
