import 'package:almas/repositories/permissions/loggedin_permissions.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MenuController {
  static void invite() {
    String message = "سلام دوست عزیز" "\n";
    message +=
        "شبکه اجتماعی جمله محیطی سالم با جوی صمیمی و دوستانه برای گفتن حرف های دل و جمله های ناب است."
        "\n";
    message += "https://cafebazaar.ir/app/ir.network.social.jomleh/?l=fa";
    Share.share(message);
  }

  static void openTelegram() {
    LoggedInPermissions.checkHasToken(() {
      RepositoriesHandler.launchURL(
        Uri.parse("https://${RepositoriesConfig.telegramURL}"),
        mode: LaunchMode.externalApplication,
      );
    });
  }

  static void openInstagram() {
    LoggedInPermissions.checkHasToken(() {
      RepositoriesHandler.launchURL(
        Uri.parse(RepositoriesConfig.instagramURL),
        mode: LaunchMode.externalApplication,
      );
    });
  }

  static void support() {
    LoggedInPermissions.checkHasToken(() {
      RepositoriesHandler.launchURL(
        Uri.parse("mailto:${RepositoriesConfig.supportEmail}"),
        mode: LaunchMode.externalApplication,
      );
    });
  }
}
