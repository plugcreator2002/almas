import 'package:almas/.env.dart';
import 'package:cafebazaar_flutter/cafebazaar_flutter.dart';
import 'package:psr_base/utils/logger.dart';

/// Its mean CafeBazaar an CB [CBServicePlugin]
class CBServicePlugin {
  late InAppPurchase cb;
  static CBServicePlugin instance = CBServicePlugin.init();

  CBServicePlugin.init() {
    if (ENV_CONFIG.IS_CAFE_BAZAAR_VERSION) {
      logger("Initialized CafeBazaarFlutter Plugin");
      cb = CafebazaarFlutter.instance.inAppPurchase(
        ENV_CONFIG.CAFE_BAZAAR_PUBLIC_KEY,
      );
    }
  }

  Future<PurchaseInfo?> purchase(dynamic id) async {
    try {
      final result = await cb.purchase(
        id.toString(),
        payLoad: "Your payload",
      );
      logger('Result.Transaction ${result?.toMap()}');
      return result;
    } catch (e) {
      logger(e.toString());
    }
    return null;
  }

  Future<bool?> consume(dynamic id) async {
    try {
      final result = await cb.consume("6277939875");
      logger('Result.Consume $result');
      return result;
    } catch (e) {
      logger(e.toString());
    }
    return null;
  }
}
