extension EnumExtensionRelated on Enum? {
  String? get nameEnum {
    if (this == null) return null;
    final data = toString();
    if (data.isNotEmpty) {
      return data.split(".")[1];
    }
    return null;
  }
}
