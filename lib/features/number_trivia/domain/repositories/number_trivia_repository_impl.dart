import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia_tdd_architecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  @override
  Future<Either<Failure, NumberTrivia>> getConcrete(int number) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandom() {
    throw UnimplementedError();
  }
}
