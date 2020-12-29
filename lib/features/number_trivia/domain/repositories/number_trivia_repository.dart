import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  //Either return Failure or NumberTrivia
  Future<Either<Failure, NumberTrivia>> getConcrete(int number);
  Future<Either<Failure, NumberTrivia>> getRandom();
}
