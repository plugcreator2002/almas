import 'package:almas/config/languages/extension/tr.dart';

class PastTime {
  final num number;
  final String format;

  factory PastTime.non() {
    return const PastTime(0, "");
  }

  @override
  String toString() {
    if (this.number == 0) return format;
    final number = "${this.number} ";
    final ago = " ${"ago".tr}";
    return "$number$format$ago";
  }

  const PastTime(this.number, this.format);
}
