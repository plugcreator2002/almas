import 'package:almas/data-server/socket_io/models/socket_response.dart';
import 'package:flutter/material.dart' show ChangeNotifier;

abstract class ParentProvider<T> with ChangeNotifier {
  void init(T? data) {}

  void onReceivedData([SocketResponse? data]) {}
}
