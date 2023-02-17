import 'package:almas/config/constants/loading_keys.dart';
import 'package:almas/data-server/server_interface/models/server_params_data.dart';
import 'package:almas/data-server/server_interface/requests/const.dart';
import 'package:almas/data-server/server_interface/server_interface.dart';

class ProductService {
  static Future<dynamic> getThemes() async {
    final response = await ServerInterface.instance.get(
      path: "${RoutesAPI.productThemes}?limit=50",
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

  static Future<dynamic> getFonts() async {
    final response = await ServerInterface.instance.get(
      path: RoutesAPI.productFonts,
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

  static Future<dynamic> createTransaction(num productId) async {
    final response = await ServerInterface.instance.post(
      path: RoutesAPI.createTransaction,
      interfaceOptions: ServerInterfaceOptions(
        data: {"productID": productId},
      ),
    );

    final conditions = [
      response.isSuccess && response.data != null,
      response.data["id"] != null && response.data["link"] != null,
    ];

    if (conditions[0] && conditions[1]) {
      return response.data;
    }
    return null;
  }
}
