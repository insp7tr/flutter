import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:typeracer_clone/private.dart';

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io(
      "http://${PrivateVariables.ipAddress}:3010",
      <String, dynamic>{
        'transports': ['websocket'],
        'autConnect': false,
      },
    );

    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
