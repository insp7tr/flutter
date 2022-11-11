import 'package:flutter/material.dart';
import 'package:typeracer_clone/models/models.dart';

class ClientStateProvider extends ChangeNotifier {
  ClientState _clientState = ClientState(
    timer: {
      'countDwon': '',
      'msg': '',
    },
  );

  Map<String, dynamic> get clientState => _clientState.toMap();

  setClientState(timer) {
    _clientState = ClientState(timer: timer);

    notifyListeners();
  }
}
