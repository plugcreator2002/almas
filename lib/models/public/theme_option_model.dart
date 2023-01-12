import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/config/themes/data/light.dart';
import 'package:almas/config/themes/theme_config.dart';

class ThemeOptionModel {
  final String id;
  final String name;
  final String? image;
  final num? price;
  final ThemeConfig theme;

  factory ThemeOptionModel.zero() {
    return ThemeOptionModel(
      theme: LightTheme(),
      name: "light".tr,
      id: "0",
    );
  }

  const ThemeOptionModel({
    required this.theme,
    required this.id,
    required this.name,
    this.image,
    this.price,
  });
}
