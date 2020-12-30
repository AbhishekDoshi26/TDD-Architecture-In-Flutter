part of 'number_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();

  @override
  List<Object> get props => [];
}

class NumberTriviaInitial extends NumberTriviaState {}

class NumberTriviaLoadingState extends NumberTriviaState {}

class NumberTriviaLoadedState extends NumberTriviaState {
  final NumberTrivia trivia;

  NumberTriviaLoadedState({this.trivia});
}

class NumberTriviaErrorState extends NumberTriviaState {
  final String errorMessage;

  NumberTriviaErrorState({this.errorMessage});
}
