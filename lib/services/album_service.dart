import 'dart:convert';

import 'package:belajarflutter/models/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  final _baseUrl = "https://jsonplaceholder.typicode.com/albums/";

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Album> album = it.map((e) => Album.fromJson(e)).toList();
        return album;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
