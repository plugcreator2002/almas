import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/data-server/rest_api/widgets/errors_request_server_popup.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/utils/popups_opener_builder.dart';
import 'package:psr_base/utils/logger.dart';

class ErrorHandler {
  static Future<void> analyze({
    int? statusCode,
    Map? body,
    List<dynamic>? messages,
    void Function(int? statusCode)? callback,
  }) async {
    try {
      final context = RepositoriesHandler.navigatorKey.currentContext!;

      if ([404, 500, 403, 0].contains(statusCode)) {
        final messages = {
          0: "0-error-server".tr,
          403: "403-error-server".tr,
          404: "404-error-server".tr,
          500: "404-error-server".tr,
        };

        PopupOpenerBuilder.centerPopup(
          context,
          child: ErrorsRequestServerPopup(errors: [
            messages[statusCode] ?? "",
          ], callback: callback),
        );
      } else {
        if (messages != null || body != null) {
          PopupOpenerBuilder.centerPopup(
            context,
            child: ErrorsRequestServerPopup(
              errors: messages ?? [body ?? []],
              statusCode: statusCode,
              callback: callback,
            ),
          );
        }
      }
      logger("HAVE ERROR FROM URL REQUEST $body");
    } catch (e) {
      logger("HAVE ERROR ON THE CATCH FROM URL REQUEST $e");
    }
  }

  static String getStatusCodeTitle(code) {
    final status = "$code-error-server".tr;
    String output = "";

    if (status != "$code-error-server") {
      output = status;
    } else {
      output = "default-error-server".tr;
    }
    return output;
  }

  static showNoNetworkAccess(bool status) {}
}
