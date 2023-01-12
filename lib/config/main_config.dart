import 'package:almas/config/languages/localization/app_localization.dart';
import 'package:almas/controllers/public/notifications/notification_service.dart';
import 'package:almas/data-server/shared_preference/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainConfig {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferencesHelper.init();
    await NotificationService.setup();
  }

  static final Iterable<LocalizationsDelegate> localizationsDelegates = [
    const AppLocalizationDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static final Iterable<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('fa'),
  ];

  static Widget builder(BuildContext context, Widget? widget) {
    return ResponsiveWrapper.builder(
      widget,
      maxWidth: 800,
      minWidth: 400,
      defaultScale: true,
      background: Container(color: const Color(0xFFF5F5F5)),
      breakpoints: const [
        ResponsiveBreakpoint.autoScale(400, name: MOBILE),
        // ResponsiveBreakpoint.resize(800, name: TABLET),
        // ResponsiveBreakpoint.resize(600, name: DESKTOP),
        // ResponsiveBreakpoint.resize(1700, name: 'XL')
      ],
    );
  }
}
