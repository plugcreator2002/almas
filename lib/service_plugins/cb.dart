import 'package:almas/.env.dart';
import 'package:cafebazaar_flutter/cafebazaar_flutter.dart';
import 'package:psr_base/utils/logger.dart';

/// Its mean CafeBazaar an CB [CBServicePlugin]
class CBServicePlugin {
  late InAppPurchase cb;
  static CBServicePlugin instance = CBServicePlugin.init();

  CBServicePlugin.init() {
    logger("Initialized CafeBazaarFlutter Plugin");
    cb = CafebazaarFlutter.instance.inAppPurchase(
      ENV_CONFIG.CAFE_BAZAAR_PUBLIC_KEY,
    );
  }

  Future<void> purchase(num id) async {
    final result = await cb.purchase(
      id.toString(),
      payLoad: "Your payload",
    );
    if (result != null) {
      logger('success: ${result.productId}');
    }
  }
}
