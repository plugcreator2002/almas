class PaginationResponse {
  PaginationResponse({
    this.page = 1,
    this.limit = 10,
  });

  void fromJsonPagination(dynamic json, num? page) {
    total = json["total"] ?? json["totals"] ?? 0;
    this.page = page ?? 1;
  }

  num page = 1;
  num total = 0;
  num limit = 10;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["page"] = page;
    map["limit"] = limit;
    return map;
  }
}
