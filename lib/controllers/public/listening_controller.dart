import 'dart:ui' show VoidCallback;

class Listening {
  final _listeners = <String, VoidCallback>{};

  void addListener(String id, void Function() listener) {
    _listeners.addAll({id: listener});
  }

  void callListener(String id) {
    if (_listeners[id] != null) {
      (_listeners[id] ?? () {})();
    }
  }

  void callAllListeners() {
    for (final listener in _listeners.entries) {
      listener.value();
    }
  }

  void removeListener(String id) {
    if (_listeners[id] != null) {
      _listeners.remove(id);
    }
  }
}
