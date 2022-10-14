import 'dart:convert';

import '../../models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class ApiRemoteDataSource {
  Future<QuoteModel> getRandomMovieQuote();
}

class ApiRemoteDataSourceImpl implements ApiRemoteDataSource {
  final http.Client httpClient;
  ApiRemoteDataSourceImpl(this.httpClient);

  @override
  Future<QuoteModel> getRandomMovieQuote() async {
    final url = Uri.parse("https://movie-quote-api.herokuapp.com/v1/quote/");
    final response = await httpClient
        .get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
