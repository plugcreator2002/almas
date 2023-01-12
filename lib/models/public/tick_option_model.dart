class TickOptionModel {
  final String id;
  final String name;
  final num? price;
  final String tick;

  const TickOptionModel({
    required this.id,
    required this.name,
    this.price,
    required this.tick,
  });
}
