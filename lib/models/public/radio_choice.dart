class RadioChoiceModel {
  final String id;
  final String label;
  final String? info;
  final String? icon;
  final String? description;
  final List<RadioChoiceModel> children;

  const RadioChoiceModel({
    required this.id,
    this.info,
    this.label = "",
    this.children = const [],
    this.icon,
    this.description,
  });
}
