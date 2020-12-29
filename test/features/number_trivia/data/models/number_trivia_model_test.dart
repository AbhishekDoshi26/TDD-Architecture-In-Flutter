import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test');

  test(
    'Should be a subclass of NumberTrivia Entity',
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group(
    'fromJson',
    () {
      test(
        'Should return a valid model when the JSON number is an integer',
        () async {
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('trivia.json'));

          final result = NumberTriviaModel.fromJson(jsonMap);
          expect(result, tNumberTriviaModel);
        },
      );
      test(
        'Should return a valid model when the JSON number is a double',
        () async {
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('trivia_double.json'));

          final result = NumberTriviaModel.fromJson(jsonMap);
          expect(result, tNumberTriviaModel);
        },
      );
    },
  );
}
