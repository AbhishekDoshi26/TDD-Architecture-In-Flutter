part of 'number_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();

  @override
  List<Object> get props => [];
}

class GetTriviaForConcrete extends NumberTriviaEvent {
  final String number;

  GetTriviaForConcrete({this.number});
}

class GetTriviaForRandom extends NumberTriviaEvent {}
