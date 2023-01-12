import 'package:almas/providers/public/loading_presenter.dart';
import 'package:almas/repositories/repositories_handler.dart';
import 'package:provider/provider.dart';

class LoadingController {
  late final LoadingPresenter presenter;

  static LoadingController instance = LoadingController();

  LoadingController() {
    presenter = Provider.of<LoadingPresenter>(
      RepositoriesHandler.navigatorKey.currentContext!,
      listen: false,
    );
  }

  bool isLoading(String? key) {
    return key != null && presenter.data[key] == true;
  }

  void create(String? key, {bool hasUpdate = true}) {
    if (key != null) {
      presenter.create(key, hasUpdate: hasUpdate);
    }
  }

  void close(String? key, {bool hasUpdate = true}) {
    if (key != null) {
      presenter.close(key, hasUpdate: hasUpdate);
    }
  }
}
