import 'dart:async';
import 'package:almas/config/languages/data/en.dart';
import 'package:almas/config/languages/data/fa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static final _localizedValues = {
    'en': enLang,
    'fa': faLang,
    'fr': {},
    'es': {},
    'ru': {},
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]![key] ?? key;
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fa', 'fr', 'es', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalization>(
      AppLocalization(locale),
    );
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
