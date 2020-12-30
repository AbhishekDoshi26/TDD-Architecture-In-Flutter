import 'dart:convert';

import 'package:number_trivia_tdd_architecture/core/error/exceptions.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;

abstract class NumberTriviaRemote {
  Future<NumberTriviaModel> getConcreteTrivia(int number);
  Future<NumberTriviaModel> getRandomTiriva();
}

class NumberTriviaRemoteImpl implements NumberTriviaRemote {
  final http.Client client;

  NumberTriviaRemoteImpl({this.client});

  @override
  Future<NumberTriviaModel> getConcreteTrivia(int number) =>
      _getTriviaFromUrl(number.toString());

  @override
  Future<NumberTriviaModel> getRandomTiriva() => _getTriviaFromUrl('random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String path) async {
    http.Response response = await client.get(
      'http://numbersapi.com/$path',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(
        json.decode(response.body),
      );
    } else
      throw ServerException();
  }
}
