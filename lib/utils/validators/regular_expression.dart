class RegularExpression {
  // static final username = RegExp("^[A-Za-z][A-Za-z0-9_]{5,29}");

  static final username = RegExp(r'^[a-zA-Z0-9_]+$');

  static final password = RegExp(
    "^[A-Za-z].*[0-9]",
  );
}
