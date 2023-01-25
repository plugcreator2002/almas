class ServerInterfaceOptions {
  ServerInterfaceOptions({
    Map<String, dynamic>? data,
    this.needToken = true,
    this.loading,
    this.messageToast,
    this.hasUpdateLoading = true,
    this.checkExpiredToken = true,
    this.successfulToast = false,
  }) {
    this.data = data ?? {};
    this.data.removeWhere((key, value) {
      return value == null;
    });
  }

  Map<String, dynamic> data = {};
  bool needToken;
  String? loading;
  String? messageToast;
  bool? hasUpdateLoading;
  Map<String, String> header = {};
  bool checkExpiredToken;
  bool successfulToast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['needToken'] = needToken;
    map['loading'] = loading;
    map['hasUpdateLoading'] = hasUpdateLoading;
    return map;
  }
}
