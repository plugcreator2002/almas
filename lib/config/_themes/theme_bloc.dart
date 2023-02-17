// import 'dart:async';
//
// import 'package:chatroom_base/ui_related/_themes/app_themes.dart';
// import 'package:chatroom_base/ui_related/_themes/theme_event.dart';
// import 'package:chatroom_base/ui_related/_themes/theme_state.dart';
// import 'package:flutter/cupertino.dart';
//
// class ThemeProvider extends ChangeNotifier {
//   ThemeState get initialState {
//     return ThemeState(
//       themeData: appThemeData[AppTheme.greenLight]!,
//     );
//   }
//
//   Stream<ThemeState> mapEventToState(
//     ThemeEvent event,
//   ) async* {
//     if (event is ThemeChanged) {
//       yield ThemeState(themeData: appThemeData[event.theme]!);
//     }
//   }
// }
