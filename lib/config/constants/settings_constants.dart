import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/mine_images.dart';
import 'package:almas/models/public/tick_option_model.dart';

class SettingsConstants {
  static final ticks = [
    TickOptionModel(
      id: "0",
      name: "blue-tick".tr,
      tick: MineImages.blueTick,
    ),
  ];
}
