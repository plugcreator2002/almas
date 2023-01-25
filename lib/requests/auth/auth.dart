import 'dart:async';

import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/config/languages/extension/tr.dart';
import 'package:almas/controllers/public/system_controller.dart';
import 'package:almas/data-server/server_interface/models/server_params_data.dart';
import 'package:almas/data-server/server_interface/server_interface.dart';
import 'package:almas/requests/const.dart';
import 'package:psr_base/utils/logger.dart';

class AuthService {
  static Future<String?> login(
    String email,
    String password,
  ) async {
    final response = await ServerInterface.instance.post(
      path: RoutesAPI.authLogin,
      interfaceOptions: ServerInterfaceOptions(
        needToken: false,
        loading: LoadingKeys.login,
        checkExpiredToken: false,
        data: {
          'email': email,
          'password': password,
          'macAddress': await SystemHandler.getDeviceID,
        },
      ),
    );

    if (response.isSuccess) {
      return response.data;
    }
    return null;
  }

  static Future<bool> signup(
    Map<String, dynamic> data,
  ) async {
    final response = await ServerInterface.instance.post(
      path: RoutesAPI.authRegister,
      interfaceOptions: ServerInterfaceOptions(
        data: data,
        needToken: false,
        successfulToast: true,
        checkExpiredToken: false,
        loading: LoadingKeys.register,
        messageToast: "please-open-your-email...".tr,
      ),
    );

    return response.isSuccess;
  }

  static Future<bool> submitVerification(
    void Function(bool result) callback,
  ) async {
    // final response = await HttpRequest.post(
    //   path: verification,
    //   loading: LoadingKeys.submitVerification,
    //   body: {},
    // );
    // bool result = false;
    // logger(response);
    // if (response != null && response["message"] == "success") {
    //   result = true;
    // }
    // callback(result);
    return false;
  }

  static Future<bool> logout() async {
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.authLogout,
      interfaceOptions: ServerInterfaceOptions(
        checkExpiredToken: false,
      ),
    );

    return response.isSuccess || response.statusCode == 401;
  }

  static Future<String?> refreshToken() async {
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.authRefresh,
      interfaceOptions: ServerInterfaceOptions(
        checkExpiredToken: false,
        needToken: false,
      ),
    );

    logger("GET REFRESH TOKEN RESPONSE: ${response.toJson()}");
    if (response.isSuccess) {
      return response.data;
    }
    return null;
  }
}
