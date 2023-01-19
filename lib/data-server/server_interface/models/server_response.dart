import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' show Response;

class ServerResponse {
  ServerResponse({
    this.statusCode,
    this.data,
    this.error,
    this.message,
    this.messages,
    this.isSuccess = false,
  });

  bool isSuccessful(num code) {
    return (code >= 200 && code < 300);
  }

  ServerResponse.fromJson(Response response) {
    final json = jsonDecode(response.body);
    isSuccess = isSuccessful(
      json['statusCode'] ?? response.statusCode,
    );
    statusCode = json['statusCode'] ?? response.statusCode;
    if (json['data'] != null) {
      data = json['data'];
    }
    if (json['error'] != null) {
      error = json['error'];
    }
    if (json['message'] != null) {
      if (json['message'].runtimeType is List) {
        messages = (json['message'] as List).cast<String>();
      } else if (json['message'].runtimeType is String) {
        message = json['message'];
      }
    }
    // logger(toJson());
  }

  bool isSuccess = false;
  num? statusCode;
  dynamic data;
  List<String>? messages;
  String? message;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSuccess'] = isSuccess;
    map['statusCode'] = statusCode;
    map['data'] = data;
    map['message'] = message ?? messages;
    map['error'] = error;
    return map;
  }
}
