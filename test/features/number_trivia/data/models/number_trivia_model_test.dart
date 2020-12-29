import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test(
    'Should be a subclass of NumberTrivia Entity',
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );
}
