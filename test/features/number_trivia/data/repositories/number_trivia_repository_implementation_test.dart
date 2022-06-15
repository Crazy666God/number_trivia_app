import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_app/core/network/network_info.dart';
import 'package:number_trivia_app/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia_app/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia_app/features/number_trivia/data/repositories/number_trivia_repository_implementation.dart';
import 'package:number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late NumberTriviaRepositoryImplementation repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUpAll(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImplementation(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group(
    'getConcreteNumberTrivia',
    () {
      final int tNumber = 1;
      final tNumberTriviaModel =
          NumberTriviaModel(number: tNumber, text: 'test trivia');
      final NumberTrivia tNumberTrivia = tNumberTriviaModel;

      test(
        'should check if the device is online',
        () async {
          // when(() => mockNetworkInfo.isConnected)
          //     .thenAnswer((invocation) async => true);
          // when(() => mockRemoteDataSource.getRandomNumberTrivia()).thenAnswer((realInvocation) async => tNumberTriviaModel);
          // await repository.getConcreteNumberTrivia(tNumber);
          
          // verify(() => mockNetworkInfo.isConnected);
        },
      );
      group(
        'device is online',
        () {
          setUpAll(() {
            when(() => mockNetworkInfo.isConnected)
                .thenAnswer((invocation) async => true);
          });

          test(
            'should return remote data when call to remote data source is successful',
            () async {
              //any()
              // when(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
              //     .thenAnswer((invocation) async => tNumberTriviaModel);

              // final result = await repository.getConcreteNumberTrivia(tNumber);

              // verify(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber));

              // expect(result, equals(Right(tNumberTrivia)));
            },
          );

          test(
            'should cache the data locally when the call to remote data source is successful',
            () async {
              //any()
              // when(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
              //     .thenAnswer((invocation) async => tNumberTriviaModel);

              //   await repository.getConcreteNumberTrivia(tNumber);

              // verify(() => mockRemoteDataSource.getConcreteNumberTrivia(tNumber));

              // verify(() => mockLocalDataSource.cacheNumberTrivia(tNumberTriviaModel));
            },
          );
        },
      );

      group('device is offline', () {
        setUpAll(() {
          when(() => mockNetworkInfo.isConnected)
              .thenAnswer((invocation) async => false);
        });
      });
    },
  );
}
