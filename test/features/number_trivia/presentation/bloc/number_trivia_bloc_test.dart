import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_app/core/util/input_converter.dart';
import 'package:number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia_app/features/number_trivia/presentation/block/bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';


class MockGetConcreteNumberTrivia extends Mock
    implements GetConcreteNumberTrivia {}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late NumberTriviaBloc bloc;
  late MockGetConcreteNumberTrivia mockGetConcreteNumberTrivia;
  late MockGetRandomNumberTrivia mockGetRandomNumberTrivia;
  late MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      getConcreteNumberTrivia: mockGetConcreteNumberTrivia,
      getRandomNumberTrivia: mockGetRandomNumberTrivia,
      inputConverter: mockInputConverter,
    );
  });

  test(
    'initialState should be Empty',
    () {
      expect(bloc.initialState, equals(Empty()));
    },
  );

  group(
    'GetTriviaForConcreteNumber',
    () {
      final tNumberString = '1';
      final tNumberParse = 1;
      final tNumberTrivia = NumberTrivia(number: 1, text: 'test trivia');

      test(
        'should call the InputConverter to validate and convert the string to an unsigned integer',
        () async {
          when(() => mockInputConverter.stringToUnsignedInteger(tNumberString))
              .thenReturn(Right(tNumberParse));

          bloc.mapEventToState(GetTriviaForConcreteNumber(tNumberString));
          await untilCalled(
              () => mockInputConverter.stringToUnsignedInteger(tNumberString));

          verify(
              () => mockInputConverter.stringToUnsignedInteger(tNumberString));
        },
      );

      // test(
      //   'should emit [Erorr] when the input is invalid',
      //   () async {
      //     when(() => mockInputConverter.stringToUnsignedInteger(tNumberString))
      //         .thenReturn(Left(InvalidInputFailure()));

      //     bloc.mapEventToState(GetTriviaForConcreteNumber(tNumberString));
      //     final expected = [
      //       Empty(),
      //       Error(message: INVALID_INPUT_FAILURE_MESSAGE),
      //     ];

      //     expectLater(bloc.state, emitsInOrder(expected));
      //   },
      // );
    },
  );
}
