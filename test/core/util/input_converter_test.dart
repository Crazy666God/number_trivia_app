import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_app/core/util/input_converter.dart';
//import 'package:mocktail/mocktail.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
      'should return an unteger when the string represents an unsigned integer',
      () async {
        final String str = '123';

        final result = inputConverter.stringToUnsignedInteger(str);

        expect(result, Right(123));
      },
    );

    test(
      'should return Failure when the string in not an integer',
      () async {
        final String str = 'abc';
        
        final result = inputConverter.stringToUnsignedInteger(str);

        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      'should return Failure when the string is negative integer',
      () async {
        final String str = '-123';
        
        final result = inputConverter.stringToUnsignedInteger(str);

        expect(result, Left(InvalidInputFailure()));
      },
    );
  });
}
