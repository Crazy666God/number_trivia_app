import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia_app/core/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  late NetworkInfoImplementation networkInfoImplementation;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUpAll(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImplementation =
        NetworkInfoImplementation(mockDataConnectionChecker);
  });

  group(
    'isConnected',
    () {
      test(
        'should forward the call to DataConnectionChecker.hasConnection',
        () async {
          when(() => mockDataConnectionChecker.hasConnection).thenAnswer((invocation) async => true);

          final result = await networkInfoImplementation.isConnected;

          verify(() => mockDataConnectionChecker.hasConnection);
          expect(result, true);
        }
      );
    },
  );
}
