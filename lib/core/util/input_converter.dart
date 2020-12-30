import 'package:dartz/dartz.dart';
import 'package:number_trivia_tdd_architecture/core/error/failure.dart';

class InputConverter {
  Either<Failure, int> stringToInt(String str) {
    try {
      final number = int.parse(str);
      if (number < 0) throw FormatException;
      return Right(number);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
