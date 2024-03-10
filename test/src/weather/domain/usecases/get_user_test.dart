import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tomorrow_weather/src/authentication/domain/entities/user.dart';
import 'package:tomorrow_weather/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tomorrow_weather/src/authentication/domain/usecases/get_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers usecase;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  final testResponse = [const User.empty()];

  test(
    "should call [AuthRepo.getUsers] and return [List<User>]",
    () async {
      // arrange
      when(() => repository.getUsers()).thenAnswer(
        (_) async => Right(testResponse),
      );

      // act
      final result = await usecase();

      // assert
      expect(result, equals(Right<dynamic, List<User>>(testResponse)));

      // check the method is called once
      verify(() => repository.getUsers()).called(1);

      // check no more interaction
      verifyNoMoreInteractions(repository);
    },
  );
}
