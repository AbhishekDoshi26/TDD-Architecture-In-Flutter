import 'package:number_trivia_tdd_architecture/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemote {
  Future<NumberTriviaModel> getConcreteTrivia(int number);
  Future<NumberTriviaModel> getRandomTiriva();
}
