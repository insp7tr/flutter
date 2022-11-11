import 'dart:convert';

import 'package:ecommerce_app/app/shared/api_routes.dart';
import "package:http/http.dart" as http;

class API {
  final http.Client httpClient = http.Client();

  //Signup
  Future signUp(Map body) async {
    const String path = "$API_URL/users";
    final Uri url = Uri.parse(path);

    http.Response response = await httpClient.post(url,
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Accept": "application/json"
        },
        body: jsonEncode(body));

    return response.body;
  }

  //Signup
  Future login(Map body) async {
    const String path = "$API_URL/auth/login";
    final Uri url = Uri.parse(path);

    http.Response response = await httpClient.post(url,
        headers: {
          "Content-type": "application/json;charset=UTF-8",
          "Accept": "application/json"
        },
        body: jsonEncode(body));

    return response.body;
  }
}
