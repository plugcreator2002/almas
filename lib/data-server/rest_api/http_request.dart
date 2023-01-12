import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:almas/controllers/public/loading_controller.dart';
import 'package:almas/data-server/rest_api/error_handler.dart';
import 'package:almas/repositories/repositories_config.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:http/http.dart' as http;
import 'package:psr_base/utils/logger.dart';

class HttpRequest {
  static Future get({
    required String path,
    Map? body,
    bool? withToken,
    bool hasUpdate = true,
    String? loading,
  }) async {
    if (loading != null) {
      LoadingController.instance.create(loading, hasUpdate: hasUpdate);
    }
    body = body ?? {};
    withToken = withToken ?? true;
    String params = '';
    body.forEach((key, value) {
      params = '${params + key}=$value&';
    });
    if (params != '') {
      params = params.substring(0, params.length - 1);
      params = '?$params';
    }

    final header = {
      'Accept': 'application/json',
    };
    if (withToken) {
      header['Authorization'] = 'Bearer ${RepositoriesHandler.authToken}';
    }

    try {
      Uri url = Uri.parse(path);

      logger(url.toString());

      final response = await http.get(url, headers: header);

      if (loading != null) {
        LoadingController.instance.close(loading);
      }
      // ErrorHandler.showNoNetworkAccess(true);
      return _createResponse(response);
    } on TimeoutException catch (e) {
      logger(e);
      if (loading != null) {
        LoadingController.instance.close(loading);
      }
      // ErrorHandler.showNoNetworkAccess(false);
    } on SocketException catch (e) {
      logger(e);
      if (loading != null) {
        LoadingController.instance.close(loading);
      }
      // ErrorHandler.showNoNetworkAccess(false);
    } catch (e) {
      logger(e);
      return Future.error({'message': 'Http request parameter error .'});
    }
  }

  static Future<Map?> post({
    required String path,
    required Map? body,
    bool? withToken,
    String? loading,
  }) async {
    if (loading != null) {
      LoadingController.instance.create(loading);
    }
    body = body ?? {};
    body.removeWhere((key, value) => value == null);
    withToken = withToken ?? true;
    final header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    if (withToken) {
      header['Authorization'] = 'Bearer ${RepositoriesHandler.authToken}';
    }
    final url = Uri.parse(path);
    logger(url);
    final response = await http.post(
      url,
      body: json.encode(body),
      headers: header,
    );
    if (loading != null) {
      LoadingController.instance.close(loading);
    }
    return _createResponse(response);
  }

  static Future<dynamic> put({
    required String path,
    required Map? body,
    bool? withToken,
    String? loading,
  }) async {
    if (loading != null) {
      LoadingController.instance.create(loading);
    }
    body = body ?? {};
    body.removeWhere((key, value) => value == null);
    withToken = withToken ?? true;
    final header = {
      'Content-type': 'application/json',
      "Accept": "application/json",
    };

    if (withToken) {
      header['Authorization'] = 'Bearer ${RepositoriesHandler.authToken!}';
    }
    logger('*** BODY IN PUT REQUEST ***');

    logger(body);
    try {
      var url = Uri.parse(path);
      logger(url);
      final request = http.put(
        url,
        body: json.encode(body),
        headers: header,
      );
      request.timeout(
        const Duration(milliseconds: RepositoriesConfig.receiveTimeout),
        onTimeout: () {
          return http.Response('Error', 408);
        },
      );

      final response = await request;
      logger(jsonDecode(response.body));
      if (loading != null) {
        LoadingController.instance.close(loading);
      }
      return _createResponse(response);
    } on TimeoutException catch (e) {
      logger(e);

      ErrorHandler.analyze(statusCode: 0);
      if (loading != null) {
        LoadingController.instance.close(loading);
      }
    } catch (e) {
      logger('--++ request ERROR ++--');
      logger(e);
      if (loading != null) {
        LoadingController.instance.close(loading);
      }
      return Future.error({'message': 'Http request parameter error .'});
    }
    if (loading != null) {
      LoadingController.instance.close(loading);
    }
    return null;
  }

  static Future<dynamic> delete({
    required String path,
    Map? body,
    bool? withToken,
    String? loading,
  }) async {
    if (loading != null) {
      LoadingController.instance.create(loading);
    }
    withToken = withToken ?? true;
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (withToken) {
      header['Authorization'] = 'Bearer ${RepositoriesHandler.authToken}';
    }

    try {
      final url = Uri.parse(path);
      logger(url);

      final response = await http.delete(
        url,
        body: json.encode(body),
        headers: header,
      );

      logger(jsonDecode(response.body));
      if (loading != null) {
        LoadingController.instance.close(loading);
      }
      return _createResponse(response);
    } on TimeoutException catch (e) {
      logger(e);

      ErrorHandler.analyze(statusCode: 0);
      if (loading != null) {
        LoadingController.instance.close(loading);
      }
    } catch (e) {
      logger('--++ request ERROR ++--');
      logger(e);
      return Future.error({'message': 'Http request parameter error .'});
    }
    return null;
  }

  static Future<Map?> upload({required String path, required File file}) async {
    try {
      final uri = Uri.parse(path);
      logger("uri: $uri");

      final headers = <String, String>{
        'Authorization': 'Bearer ${RepositoriesHandler.authToken}',
        'Content-type': 'image/png',
        'Accept': 'application/json',
      };

      final response = await http.post(
        uri,
        body: file.readAsBytesSync(),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return _createResponse(response);
      }
    } on TimeoutException catch (e) {
      logger(e.message);
      ErrorHandler.analyze(statusCode: 0);
    } catch (e) {
      logger(e);
      return Future.error({'message': 'Http request parameter error .'});
    }
    return null;
  }

  static bool isSuccessful(num code) {
    return (code >= 200 && code < 300);
  }
}

dynamic _createResponse(http.Response? response) {
  if (response != null) {
    // logger("Response status ${response.statusCode}");
    // logger("Response body ${response.body}");
    if (HttpRequest.isSuccessful(response.statusCode)) {
      return jsonDecode(response.body);
    } else {
      ErrorHandler.analyze(
        statusCode: response.statusCode,
        body: jsonDecode(response.body),
      );
    }
  } else {}
}
