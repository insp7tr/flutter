import 'dart:convert';

import 'package:bloc_api_get/models/album_model.dart';
import 'package:http/http.dart';

class AlbumRepository {
  String endpoint = "https://jsonplaceholder.typicode.com/albums";

  Future<List<Album>> getAlbums() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);

      return result.map((e) => Album.fromMap(e)).toList();
    } else {
      throw Exception(response);
    }
  }
}
