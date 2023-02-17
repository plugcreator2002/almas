class SettingProductModel {
  SettingProductModel({
    this.id,
    this.name,
    this.type,
    this.price = 0,
    this.isBackground = false,
    this.createdAt,
    this.updatedAt,
  });

  SettingProductModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    price = json['price'] ?? 0;
    isBackground = json['is_background'] ?? false;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? name;
  String? type;
  num price = 0;
  bool isBackground = false;
  String? createdAt;
  String? updatedAt;

  bool get isFree => price == 0;

  bool get nonFree => price > 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['price'] = price;
    map['is_background'] = isBackground;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
