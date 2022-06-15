import 'package:equatable/equatable.dart';


abstract class NumberTriviaEvent extends Equatable {
  final List list;
  
  const NumberTriviaEvent([this.list = const <dynamic>[]]);

  @override
  List<Object> get props => [list];
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber(this.numberString) :super([numberString]);
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {

}