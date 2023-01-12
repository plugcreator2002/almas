extension ListRelated<T> on List<T> {
  List<T> safeSublist(int start, int end) {
    if (length >= end) {
      return sublist(start, end);
    }
    return this;
  }
}
