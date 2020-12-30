import 'package:number_trivia_tdd_architecture/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocal {
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
