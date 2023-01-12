import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/data-server/server_interface/models/server_params_data.dart';
import 'package:almas/data-server/server_interface/server_interface.dart';
import 'package:almas/requests/const.dart';

class SettingsService {
  static Future<dynamic> themes() async {
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.settingThemes,
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.themes,
        hasUpdateLoading: false,
      ),
    );

    final conditions = [
      response.isSuccess && response.data != null,
      response.data["themes"] != null && response.data["themes"] is List
    ];

    if (conditions[0] && conditions[1]) {
      return response.data;
    }
    return null;
  }

  static Future<dynamic> fonts() async {
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.settingFonts,
      interfaceOptions: ServerInterfaceOptions(
        loading: LoadingKeys.fonts,
        hasUpdateLoading: false,
      ),
    );

    final conditions = [
      response.isSuccess && response.data != null,
      response.data["fonts"] != null && response.data["fonts"] is List
    ];

    if (conditions[0] && conditions[1]) {
      return response.data;
    }
    return null;
  }
}
