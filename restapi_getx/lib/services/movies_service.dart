import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:restapi_getx/movie.dart';

class MoviesService {
  Future<List<Movie>?> movies(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final fromJson = json.decode(response.body) as Map;
        final allMovies = fromJson['results'] as List;
        return allMovies.map((movie) => Movie.fromMap(movie)).toList();
      } else {
        throw throw Exception();
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
