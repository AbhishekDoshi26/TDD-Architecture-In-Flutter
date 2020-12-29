import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/usecases/get_concrete.dart';

class MockRepository extends Mock implements NumberTriviaRepository {}

void main() {
  GetConcrete useCase;
  MockRepository mockRepository;
  setUp(() {
    mockRepository = MockRepository();
    useCase = GetConcrete(repository: mockRepository);
  });
  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'test', number: tNumber);
  test(
    'should get trivia for the number from the repository',
    () async {
      when(mockRepository.getConcrete(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      final result = await useCase.execute(number: tNumber);
      expect(result, Right(tNumberTrivia));
      verify(mockRepository.getConcrete(tNumber));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
