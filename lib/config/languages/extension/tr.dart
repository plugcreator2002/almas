import 'package:almas/config/languages/localization/app_localization.dart';
import 'package:almas/repositories/repositories_handler.dart';

extension Translate on String {
  String get tr {
    return AppLocalization.of(RepositoriesHandler.context)?.translate(this) ??
        "";
  }
}
