import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia_tdd_architecture/core/util/input_converter.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/usecases/get_concrete.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/domain/usecases/get_random.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

const String Server_Failure_Message = 'Server Failure';
const String Cache_Failure_Message = 'Cache Failure';
const String Invalid_Input_Failure_Message = 'Invalid Input';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcrete getConcrete;
  final GetRandom getRandom;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    this.inputConverter,
    this.getConcrete,
    this.getRandom,
  }) : super(NumberTriviaInitial());

  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) async* {
    if (event is GetTriviaForConcrete) {
      final data = inputConverter.stringToInt(event.number);
      yield* data.fold(
        (failure) async* {
          yield NumberTriviaErrorState(
              errorMessage: Invalid_Input_Failure_Message);
        },
        (integer) => throw UnimplementedError(),
      );
    }
  }
}
