class RegularExpression {
  static final username = RegExp("^[A-Za-z][A-Za-z0-9_]{5,29}");

  static final enLetters = RegExp(r'^[a-zA-Z0-9]+$');

  static final password = RegExp(
    "^[A-Za-z].*[0-9]",
  );
}
