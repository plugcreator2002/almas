import 'package:almas/.env.dart';
import 'package:almas/data-server/server_interface/requests/product/product.dart';
import 'package:almas/service_plugins/cb.dart';
import 'package:psr_base/utils/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionService {
  static Future<void> purchase(dynamic id) async {
    if (ENV_CONFIG.IS_CAFE_BAZAAR_VERSION) {
      final result = await CBServicePlugin.instance.purchase(id);
      logger('Result From Payment.Online.CafeBazaar ${result?.toMap()}');
    } else {
      final response = await ProductService.createTransaction(id);
      if (response != null && await canLaunchUrl(Uri.parse(response["link"]))) {
        final result = await launchUrl(
          Uri.parse(response["link"]),
          mode: LaunchMode.inAppWebView,
        );
        logger("Result From Payment.Online: $result");
      }
    }
  }

  static Future<bool> consume(dynamic id) async {
    logger(id);
    if (ENV_CONFIG.IS_CAFE_BAZAAR_VERSION) {
      return await CBServicePlugin.instance.consume(id) ?? false;
    }
    return false;
  }
}
