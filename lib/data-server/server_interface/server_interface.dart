import 'dart:async';
import 'dart:convert';

import 'package:almas/data-server/server_interface/models/server_params_data.dart';
import 'package:almas/data-server/server_interface/models/server_response.dart';
import 'package:almas/data-server/server_interface/server_interface_config.dart';
import 'package:http/http.dart' as http;
import 'package:psr_base/packages.dart' show basename;
import 'package:psr_base/utils/logger.dart';
import 'package:share_plus/share_plus.dart';

class ServerInterface extends RequestInterfaceTools {
  static ServerInterface instance = ServerInterface();
  bool loggerEnabled = true;

  Future<ServerResponse> get({
    required String path,
    ServerInterfaceOptions? interfaceOptions,
  }) async {
    final options = configOptions(interfaceOptions);

    String params = "";
    String url = path;

    if (options.data.isNotEmpty) {
      options.data.forEach((key, value) {
        params += "$key=$value&";
      });

      if (params.isNotEmpty) {
        params = params.substring(0, params.length - 1);
        params = '?$params';
      }
    }

    url += params;

    try {
      logger("url: $url", loggerEnabled);
      final response = await http.get(
        Uri.parse(url),
        headers: instance.header,
      );

      return createResponse(
        options: options,
        response: response,
        reCall: () async => await get(
          path: path,
          interfaceOptions: interfaceOptions,
        ),
      );
    } catch (error) {
      if (options.loading != null) {
        closeLoading(options.loading, options.hasUpdateLoading);
      }
      return errorResponse(error.toString());
    }
  }

  Future<ServerResponse> post({
    required String path,
    ServerInterfaceOptions? interfaceOptions,
  }) async {
    final options = configOptions(interfaceOptions);

    try {
      logger("url: $path", loggerEnabled);
      final response = await http.post(
        Uri.parse(path),
        body: json.encode(options.data),
        headers: instance.header,
      );

      return createResponse(
        options: options,
        response: response,
        reCall: () async => await post(
          path: path,
          interfaceOptions: interfaceOptions,
        ),
      );
    } catch (error) {
      if (options.loading != null) {
        closeLoading(options.loading, options.hasUpdateLoading);
      }
      return errorResponse(error.toString());
    }
  }

  Future<ServerResponse> put({
    required String path,
    ServerInterfaceOptions? interfaceOptions,
  }) async {
    final options = configOptions(interfaceOptions);

    try {
      logger("url: $path", loggerEnabled);
      final response = await http.put(
        Uri.parse(path),
        body: json.encode(options.data),
        headers: instance.header,
      );

      return createResponse(
        options: options,
        response: response,
        reCall: () async => await put(
          path: path,
          interfaceOptions: interfaceOptions,
        ),
      );
    } catch (error) {
      if (options.loading != null) {
        closeLoading(options.loading, options.hasUpdateLoading);
      }
      return errorResponse(error.toString());
    }
  }

  Future<ServerResponse> patch({
    required String path,
    ServerInterfaceOptions? interfaceOptions,
  }) async {
    final options = configOptions(interfaceOptions);

    try {
      logger("url: $path", loggerEnabled);
      final response = await http.patch(
        Uri.parse(path),
        body: json.encode(options.data),
        headers: instance.header,
      );

      return createResponse(
        options: options,
        response: response,
        reCall: () async => await patch(
          path: path,
          interfaceOptions: interfaceOptions,
        ),
      );
    } catch (error) {
      if (options.loading != null) {
        closeLoading(options.loading, options.hasUpdateLoading);
      }
      return errorResponse(error.toString());
    }
  }

  Future<ServerResponse> delete({
    required String path,
    ServerInterfaceOptions? interfaceOptions,
  }) async {
    final options = configOptions(interfaceOptions);

    try {
      logger("url: $path", loggerEnabled);
      final response = await http.delete(
        Uri.parse(path),
        body: json.encode(options.data),
        headers: instance.header,
      );

      return createResponse(
        options: options,
        response: response,
        reCall: () async => await delete(
          path: path,
          interfaceOptions: interfaceOptions,
        ),
      );
    } catch (error) {
      if (options.loading != null) {
        closeLoading(options.loading, options.hasUpdateLoading);
      }
      return errorResponse(error.toString());
    }
  }

  Future<ServerResponse> upload(
    String path, {
    required XFile file,
    required String field,
    ServerInterfaceOptions? interfaceOptions,
  }) async {
    final options = configOptions(interfaceOptions);

    try {
      final byteStream = http.ByteStream(file.openRead());
      byteStream.cast();
      final fileLength = await file.length();
      final multipartRequest = http.MultipartRequest(
        "POST",
        Uri.parse(path),
      );

      multipartRequest.headers.addAll(instance.header);
      final multipartFile = http.MultipartFile(
        field,
        byteStream,
        fileLength,
        filename: basename(file.path),
      );

      logger("url: $path", loggerEnabled);
      multipartRequest.files.add(multipartFile);
      final send = await multipartRequest.send();

      if (options.loading != null) {
        closeLoading(options.loading, options.hasUpdateLoading);
      }

      final response = await http.Response.fromStream(send);
      return createResponse(
        options: options,
        response: response,
        reCall: () async => await upload(
          path,
          file: file,
          field: field,
          interfaceOptions: interfaceOptions,
        ),
      );
    } catch (error) {
      if (options.loading != null) {
        closeLoading(options.loading, options.hasUpdateLoading);
      }
      return errorResponse(error.toString());
    }
  }
}
