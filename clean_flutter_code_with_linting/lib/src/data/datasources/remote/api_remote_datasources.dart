import '../../models/quote_model.dart';
import 'h';
abstract class ApiRemoteDataSource {
  Future<QuoteModel> getRandomMovieQuote();
}

class ApiRemoteDataSourceImpl implements ApiRemoteDataSource {
  final http.Client httpClient;
  ApiRemoteDataSourceImpl(this.httpClient);
}
