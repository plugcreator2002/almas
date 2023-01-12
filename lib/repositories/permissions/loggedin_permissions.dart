import 'package:almas/repositories/repositories_handler.dart';

class LoggedInPermissions {
  static bool get hasPermission {
    return RepositoriesHandler.authToken != null;
  }

  static void checkHasToken(void Function() callback) {
    bool hasPermission = RepositoriesHandler.authToken != null;
    if (hasPermission) {
      callback();
    }
  }
}
