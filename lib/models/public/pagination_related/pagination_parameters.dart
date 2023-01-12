class PaginationParameters {
  const PaginationParameters({
    this.page = 1,
    this.limit = 10,
    this.isRefresh = false,
  });

  final num page;
  final num limit;
  final bool isRefresh;

  String get parameters {
    return "?page=$page&limit=$limit";
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["page"] = page;
    map["limit"] = limit;
    return map;
  }
}
