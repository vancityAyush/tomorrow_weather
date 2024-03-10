import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tomorrow_weather/core/errors/exceptions.dart';
import 'package:tomorrow_weather/core/errors/failure.dart';
import 'package:tomorrow_weather/src/authentication/data/datasources/authenrication_remote_data_source.dart';
import 'package:tomorrow_weather/src/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:tomorrow_weather/src/authentication/domain/entities/user.dart';

class MockAuthRemoteDataSrc extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImpl repoImpl;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSrc();
    repoImpl = AuthenticationRepositoryImpl(remoteDataSource);
  });

  const tException =
      ApiException(message: "Uknown error occured", statusCode: 500);

  group("createUser", () {
    const createdAt = 'whatever.createdAt';
    const name = 'whatever.name';
    const avatar = 'whatever.avatar';

    test(
        "should call the [RemoteDataSource.createUser] and complete"
        "successfully when the call to the remote source is successfull",
        () async {
      // arrange
      when(() => remoteDataSource.createUser(
            createdAt: any(named: "createdAt"),
            name: any(named: "name"),
            avatar: any(named: "avatar"),
          )).thenAnswer((_) async => Future.value());

      // act
      final result = await repoImpl.createUser(
          createdAt: createdAt, name: name, avatar: avatar);

      // assert
      expect(result, equals(const Right(null)));
      // check that remote source's createUSer is called and with right data
      verify(() => remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar)).called(1);
      // verify that there is no interaction with the remote source
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
        "should return a [ServerFailure] when the call to the remote source is unsuccessful",
        () async {
      // arrange
      when(() => remoteDataSource.createUser(
            createdAt: any(named: "createdAt"),
            name: any(named: "name"),
            avatar: any(named: "avatar"),
          )).thenThrow(
        tException,
      );

      final result = await repoImpl.createUser(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      );

      expect(
        result,
        equals(
          Left(
            ApiFailure.fromException(tException),
          ),
        ),
      );
      verify(() => remoteDataSource.createUser(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          )).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group("getUsers", () {
    const createdAt = 'whatever.createdAt';
    const name = 'whatever.name';
    const avatar = 'whatever.avatar';

    test(
        "should call the [RemoteDataSource.getUsers] and return [List<User>] when call to remote source is successfull",
        () async {
      // arrange
      when(() => remoteDataSource.getUsers()).thenAnswer(
        (_) async => [],
      );

      // act
      final result = await repoImpl.getUsers();

      // assert
      expect(result, isA<Right<dynamic, List<User>>>());
      // check that remote source's createUSer is called and with right data
      verify(() => remoteDataSource.getUsers()).called(1);
      // verify that there is no interaction with the remote source
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
        "should return a [APIFailure] when the call to the remote source is unsuccessful",
        () async {
      // arrange
      when(() => remoteDataSource.getUsers()).thenThrow(tException);

      final result = await repoImpl.getUsers();

      expect(
        result,
        equals(
          Left(
            ApiFailure.fromException(tException),
          ),
        ),
      );
      verify(() => remoteDataSource.createUser(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          )).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
  });
}
