import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcrete {
  final NumberTriviaRepository repository;

  GetConcrete({this.repository});

  Future<Either<Failure, NumberTrivia>> execute({@required int number}) async {
    return await repository.getConcrete(number);
  }
}
