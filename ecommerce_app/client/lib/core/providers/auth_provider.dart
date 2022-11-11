import 'package:ecommerce_app/core/services/api.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final API _api = API();

  signUp(Map body) async {
    try {
      _api.signUp(body).then((authData) => {print(authData)});
    } catch (e) {
      print(e);
    }
  }

  login(Map body) async {
    try {
      _api.login(body).then((authData) async {
        // Map<String, dynamic> parsedData = await json.decode(authData);
        // print(parsedData['access_token']);
        print(authData);
      });
    } catch (e) {
      print(e);
    }
  }
}
