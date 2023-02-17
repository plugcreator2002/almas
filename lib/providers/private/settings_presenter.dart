import 'package:almas/.env.dart';
import 'package:almas/data-server/server_interface/requests/product/product.dart';
import 'package:almas/models/private/settings/fonts/setting_fonts_response.dart';
import 'package:almas/models/private/settings/setting_product_model.dart';
import 'package:almas/models/private/settings/themes/setting_themes_response.dart';
import 'package:almas/providers/config/parent_provider.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/service_plugins/transaction.dart';
import 'package:psr_base/utils/logger.dart';

class SettingsPresenter extends ParentProvider {
  String? tickID;
  SettingProductModel? theme;
  SettingProductModel? font;

  SettingFontsResponse fonts = SettingFontsResponse();
  SettingThemesResponse themes = SettingThemesResponse();

  Future<void> getFonts() async {
    final response = await ProductService.getFonts();

    if (response != null) {
      final result = SettingFontsResponse.fromJson(
        json: response,
        data: fonts.data,
      );

      if (result.data != null && (result.data?.length ?? 0) > 4) {
        font ??= (result.data ?? [])[2];
      }
      fonts = result;
      notifyListeners();
    }
  }

  Future<void> getThemes() async {
    final response = await ProductService.getThemes();

    if (response != null) {
      final result = SettingThemesResponse.fromJson(
        json: response,
        data: themes.data,
      );
      logger(result.data);

      themes = result;
      notifyListeners();
    }
  }

  void changeTheme(SettingProductModel model) {
    theme = model;
    notifyListeners();
  }

  void changeFont(SettingProductModel model) {
    font = model;
    notifyListeners();
  }

  void changeTick(String id) {
    tickID = id;
    notifyListeners();
  }

  bool submit() {
    final conditions = [
      theme != null && RepositoriesHandler.getTheme()?.id != theme?.id,
      font != null && RepositoriesHandler.getFont()?.id != font?.id,
    ];
    if (conditions[0]) {
      RepositoriesHandler.saveTheme(
        theme ?? SettingProductModel(),
      );
    }
    if (conditions[1]) {
      RepositoriesHandler.saveFont(
        font ?? SettingProductModel(),
      );
    }
    return conditions.contains(true);
  }

  void payment(SettingProductModel model) {
    dynamic productId;
    if (ENV_CONFIG.IS_CAFE_BAZAAR_VERSION) {
      productId = "${model.name}-${model.id}";
    } else {
      productId = model.id;
    }
    if (model.id != null) {
      TransactionService.purchase(productId);
    }
  }

  @override
  void init([data]) {
    theme = RepositoriesHandler.getTheme();
    font = RepositoriesHandler.getFont();
    getFonts();
    getThemes();
  }
}
