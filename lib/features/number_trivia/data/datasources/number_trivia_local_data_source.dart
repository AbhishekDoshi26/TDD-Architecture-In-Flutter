import 'dart:convert';

import 'package:number_trivia_tdd_architecture/core/error/exceptions.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NumberTriviaLocal {
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalImpl implements NumberTriviaLocal {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalImpl({this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
    if (jsonString != null)
      return Future.value(
        NumberTriviaModel.fromJson(
          json.decode(jsonString),
        ),
      );
    else
      throw CacheException();
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    final cacheData = json.encode(triviaToCache.toJson());
    return sharedPreferences.setString(CACHED_NUMBER_TRIVIA, cacheData);
  }
}
