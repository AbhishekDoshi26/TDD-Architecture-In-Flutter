import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia_tdd_architecture/core/usecases/usecase.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/usecases/get_random.dart';

class MockRepository extends Mock implements NumberTriviaRepository {}

void main() {
  GetRandom useCase;
  MockRepository mockRepository;
  setUp(() {
    mockRepository = MockRepository();
    useCase = GetRandom(repository: mockRepository);
  });

  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);
  test(
    'should get trivia from the repository',
    () async {
      when(mockRepository.getRandom())
          .thenAnswer((_) async => Right(tNumberTrivia));
      final result = await useCase(NoParams());
      expect(result, Right(tNumberTrivia));
      verify(mockRepository.getRandom());
      verifyNoMoreInteractions(mockRepository);
    },
  );
}
