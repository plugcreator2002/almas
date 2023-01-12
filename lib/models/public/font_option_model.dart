import 'package:almas/config/mine_fonts.dart';

class FontOptionModel {
  final String id;
  final String name;
  final String family;
  final num? price;

  factory FontOptionModel.zero() {
    return const FontOptionModel(
      id: "1",
      name: "",
      family: MineFonts.mitra,
    );
  }

  const FontOptionModel({
    required this.id,
    required this.name,
    required this.family,
    this.price,
  });
}
