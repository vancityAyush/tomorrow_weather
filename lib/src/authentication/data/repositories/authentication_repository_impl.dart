import 'package:dartz/dartz.dart';
import 'package:tomorrow_weather/core/errors/exceptions.dart';
import 'package:tomorrow_weather/core/errors/failure.dart';
import 'package:tomorrow_weather/core/utils/typedef.dart';
import 'package:tomorrow_weather/src/authentication/data/datasources/authenrication_remote_data_source.dart';
import 'package:tomorrow_weather/src/authentication/domain/entities/user.dart';

import '../../domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _remoteDataSource;

  AuthenticationRepositoryImpl(this._remoteDataSource);

  @override
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // Test-Driven Development (TDD)
    // call the remote data source
    // make sure that it returns the proper date if there is no exception
    // check if the mothod returns the proper data
    // check if when the remoteDataSource throws an exception, we return a failure
    // and if it doesn't throw an exception, we return a success data
    try {
      await _remoteDataSource.createUser(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      );
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
