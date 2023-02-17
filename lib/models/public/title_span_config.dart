import 'dart:ui' show Color, VoidCallback;

class TitleSpanConfig {
  final String text;
  final double fontSize;
  final Color? color;
  final VoidCallback? onTap;

  const TitleSpanConfig({
    required this.text,
    this.fontSize = 14,
    this.color,
    this.onTap,
  });
}
