import 'package:number_trivia_app/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  
  ///Calls the http://numbersapi.com/{number} endpoint.
  ///
  ///Throws a [ServerExsepteion] for all error codes.
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  
  ///Calls the http://numbersapi.com/random endpoint.
  ///
  ///Throws a [ServerExseption] for all error codes.
  Future<NumberTriviaModel> getRandomNumberTrivia();
  
}