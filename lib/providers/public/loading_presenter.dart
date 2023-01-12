import 'package:flutter/material.dart' show ChangeNotifier;

class LoadingPresenter with ChangeNotifier {
  final data = <String, bool>{};

  void create(String key, {bool hasUpdate = true}) {
    data[key] = true;
    if (hasUpdate) notifyListeners();
    Future.delayed(const Duration(seconds: 4), () {
      if (data[key] == true) {
        data[key] = false;
        if (hasUpdate) notifyListeners();
      }
    });
  }

  void close(String key, {bool hasUpdate = true}) {
    if (data[key] != null) {
      data.remove(key);
      if (hasUpdate) notifyListeners();
    }
  }
}
