import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia_tdd_architecture/core/usecases/usecase.dart';

import '../../../../core/error/failure.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetConcrete implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcrete({this.repository});

  //call method can be directly called without specifyin the name.
  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcrete(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({this.number});
  @override
  List<Object> get props => [number];
}
