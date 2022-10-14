import 'package:dartz/dartz.dart';

abstract class ApiRepository {
  Future<Either<Failure, QuoteEntity>> getRandomMoviewQuote();
}
