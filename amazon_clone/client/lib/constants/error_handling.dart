import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

void htppErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      EasyLoading.showError(jsonDecode(response.body)['msg']);
      inspect(jsonDecode(response.body));
      break;
    case 500:
      EasyLoading.showError(jsonDecode(response.body)['error']);
      inspect(jsonDecode(response.body));
      break;
    default:
      EasyLoading.showError(response.body);
      inspect(jsonDecode(response.body));
  }
}
