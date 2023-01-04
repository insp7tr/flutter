import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_search_clone/config/api_json.dart';
import 'package:google_search_clone/config/api_key.dart';
import 'package:http/http.dart' as http;

class ApiService {
  bool isDummyData = true;

  Future<Map<String, dynamic>> fetchData({
    required String queryTerm,
    String start = "0",
  }) async {
    try {
      if (!isDummyData) {
        String q = queryTerm.contains(' ')
            ? queryTerm.split(' ').join('%20')
            : queryTerm;

        final response = await http.get(
          Uri.parse(
              'htps://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$contextKey&q=$q&start=$start'),
        );

        if (response.statusCode == 200) {
          final jsonData = response.body;
          final respData = json.decode(jsonData);

          return respData;
        }
      }
    } catch (e) {
      if (kDebugMode) print(e);
    }

    return apiResponse;
  }
}
