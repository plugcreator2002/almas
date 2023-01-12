extension StringSecuringExtension on String? {
  String safeSubstring(int start, int end) {
    final data = this ?? "";
    if (data.length >= end) {
      return data.substring(start, end);
    }
    return this ?? "";
  }
}
