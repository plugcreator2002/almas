import 'package:almas/models/private/settings/fonts/setting_fonts_response.dart';
import 'package:almas/models/private/settings/setting_product_model.dart';
import 'package:almas/models/private/settings/themes/setting_themes_response.dart';
import 'package:almas/providers/config/parent_provider.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:almas/requests/settings/settings.dart';

final freeThemes = [
  SettingProductModel(
    id: 1111,
    price: 0,
    type: "theme",
    name: "light",
  ),
  SettingProductModel(
    id: 6533,
    price: 0,
    type: "theme",
    name: "dark",
  ),
  SettingProductModel(
    id: 2222,
    price: 0,
    type: "theme",
    name: "red",
  ),
  SettingProductModel(
    id: 3333,
    price: 0,
    type: "theme",
    name: "orange",
  ),
  SettingProductModel(
    id: 4444,
    price: 0,
    type: "theme",
    name: "green",
  ),
];

class SettingsPresenter extends ParentProvider {
  String? tickID;
  SettingProductModel? theme;
  SettingProductModel? font;

  SettingFontsResponse fonts = SettingFontsResponse();
  SettingThemesResponse themes = SettingThemesResponse();

  Future<void> getFonts() async {
    final response = await SettingsService.fonts();

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
    final response = await SettingsService.themes();

    if (response != null) {
      final result = SettingThemesResponse.fromJson(
        json: response,
        data: themes.data,
      );

      theme ??= freeThemes[0];
      themes = result;
      themes.data = [
        ...freeThemes,
        ...(themes.data ?? []),
      ];
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

  void submit() {
    if (theme != null) {
      RepositoriesHandler.saveTheme(
        theme ?? SettingProductModel(),
      );
    }
    if (font != null) {
      RepositoriesHandler.saveFont(
        font ?? SettingProductModel(),
      );
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
