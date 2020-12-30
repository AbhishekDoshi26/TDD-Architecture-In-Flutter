import 'package:number_trivia_tdd_architecture/core/error/exceptions.dart';
import 'package:number_trivia_tdd_architecture/core/platform/network_info.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia_tdd_architecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemote remoteDataSource;
  final NumberTriviaLocal localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    this.remoteDataSource,
    this.localDataSource,
    this.networkInfo,
  });
  @override
  Future<Either<Failure, NumberTrivia>> getConcrete(int number) async {
    return await _getTrivia(() => remoteDataSource.getConcreteTrivia(number));
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandom() async {
    return await _getTrivia(() => remoteDataSource.getRandomTiriva());
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
      Future<NumberTrivia> Function() getConcreteOrRandom) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
