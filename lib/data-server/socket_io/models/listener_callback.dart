import 'package:almas/data-server/socket_io/models/socket_response.dart';

/// emit listeners
class ListenerCallBack {
  final String? key;
  final void Function(SocketResponse response)? callback;

  const ListenerCallBack({
    this.key,
    this.callback,
  });
}
