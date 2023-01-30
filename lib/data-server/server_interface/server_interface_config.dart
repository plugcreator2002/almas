// ignore_for_file: use_build_context_synchronously
import 'dart:convert';

import 'package:almas/controllers/private/auth/auth_controller.dart';
import 'package:almas/controllers/public/loading_controller.dart';
import 'package:almas/data-server/server_interface/models/server_params_data.dart';
import 'package:almas/data-server/server_interface/models/server_response.dart';
import 'package:almas/data-server/shared_preference/shared_preferences.dart';
import 'package:almas/utils/popups_opener_builder.dart';
import 'package:http/http.dart' as http;
import 'package:psr_base/utils/logger.dart';

class RequestInterfaceTools {
  final header = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };

  void clearCookies() {
    if (header["Cookie"] != null) {
      header.remove("Cookie");
      SharedPreferencesPublic.removeCookies();
    }
  }

  void setHeaders() {
    if (SharedPreferencesPublic.cookies != null) {
      header["Cookie"] = SharedPreferencesPublic.cookies ?? "";
    }
    if (SharedPreferencesPublic.authToken != null) {
      header["Authorization"] = "Bearer ${SharedPreferencesPublic.authToken}";
    }
  }

  Future<ServerResponse> createResponse({
    required ServerInterfaceOptions options,
    required http.Response response,
    required Future<ServerResponse> Function() reCall,
  }) async {
    if (response.statusCode == 401 && options.checkExpiredToken) {
      final result = await AuthController.refreshToken();
      if (result) {
        return await reCall();
      }
    }

    if (options.loading != null) {
      closeLoading(options.loading, options.hasUpdateLoading);
    }

    final cookie = response.headers['set-cookie'];
    if (cookie != null) {
      int index = cookie.indexOf(';');
      final result = (index == -1) ? cookie : cookie.substring(0, index);
      header["Cookie"] = result;
      SharedPreferencesPublic.saveCookies(result);
    }

    final result = ServerResponse.fromJson(response);

    if (result.isSuccess && options.successfulToast) {
      String message = result.messages?[0] ?? result.message ?? "";
      if (message.isEmpty && options.messageToast != null) {
        message = options.messageToast ?? "";
      }
      if (message.isNotEmpty) {
        PopupOpenerBuilder.toast(content: message);
      }
    }

    return result;
  }

  Future<ServerResponse> errorResponse(String error) async {
    logger(error);
    final response = http.Response(
      jsonEncode({"statusCode": 406, "error": error}),
      406,
    );

    final result = ServerResponse.fromJson(response);

    return result;
  }

  void closeLoading(String? loading, bool? hasUpdateLoading) {
    LoadingController.instance.close(
      loading,
      hasUpdate: true,
    );
  }

  ServerInterfaceOptions configOptions(
    ServerInterfaceOptions? options,
  ) {
    options ??= ServerInterfaceOptions();
    options.header = header;

    if (options.loading != null) {
      LoadingController.instance.create(
        options.loading,
        hasUpdate: options.hasUpdateLoading ?? true,
      );
    }

    if (options.needToken != true) {
      final headerOptions = options.header;
      headerOptions.remove("Authorization");
      options.header = headerOptions;
    }

    return options;
  }
}
