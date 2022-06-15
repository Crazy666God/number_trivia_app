import 'package:equatable/equatable.dart';
import 'package:number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaState extends Equatable {
  final List list;
  
  const NumberTriviaState([this.list = const <dynamic>[]]);

  @override
  List<Object> get props => [list];
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({required this.trivia}) : super([trivia]);
}

class Error extends NumberTriviaState {
  final String message;

  Error({required this.message}) : super([message]);
}