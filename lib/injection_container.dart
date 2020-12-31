import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:number_trivia_tdd_architecture/core/network/network_info.dart';
import 'package:number_trivia_tdd_architecture/core/network/network_info_impl.dart';
import 'package:number_trivia_tdd_architecture/core/util/input_converter.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/usecases/get_concrete.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/usecases/get_random.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'features/number_trivia/domain/repositories/number_trivia_repository_impl.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  //Features - Number Trivia
  serviceLocator.registerFactory(
    () => NumberTriviaBloc(
      getConcrete: serviceLocator(),
      getRandom: serviceLocator(),
      inputConverter: serviceLocator(),
    ),
  );

  //Use Cases of above registration
  serviceLocator.registerLazySingleton(
    () => GetConcrete(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => GetRandom(
      repository: serviceLocator(),
    ),
  );

  //Repository for above
  serviceLocator.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      localDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NumberTriviaLocal>(
    () => NumberTriviaLocalImpl(
      sharedPreferences: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<NumberTriviaRemote>(
    () => NumberTriviaRemoteImpl(
      client: serviceLocator(),
    ),
  );
  //Core
  serviceLocator.registerLazySingleton(() => InputConverter());
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: serviceLocator(),
    ),
  );

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => DataConnectionChecker());
}
