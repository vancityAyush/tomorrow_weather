import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tomorrow_weather/core/errors/exceptions.dart';
import 'package:tomorrow_weather/core/utils/constants.dart';
import 'package:tomorrow_weather/src/authentication/data/datasources/authenrication_remote_data_source.dart';
import 'package:tomorrow_weather/src/authentication/data/models/user_model.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late AuthenticationRemoteDataSource remoteDataSource;

  setUp(() {
    client = MockClient();
    remoteDataSource = AuthRemoteDataSrcImpl(client);
    registerFallbackValue(Uri());
  });

  group("createUser", () {
    test('should complete successfully when the status code is 200 or 201',
        () async {
      when(
        () => client.post(
          any(),
          body: any(named: "body"),
          headers: {
            "Content-Type": "application/json",
          },
        ),
      ).thenAnswer(
        (_) async => http.Response("User created successfully", 201),
      );

      final methodCall = remoteDataSource.createUser;

      expect(
          methodCall(
            createdAt: "createAt",
            name: "name",
            avatar: "avatar",
          ),
          completes);

      verify(() => client.post(
            Uri.https(kBaseUrl, kCreateUserEndpoint),
            body: jsonEncode({
              "createdAt": "createAt",
              "name": "name",
              "avatar": "avatar",
            }),
            headers: {
              "Content-Type": "application/json",
            },
          )).called(1);

      verifyNoMoreInteractions(client);
    });

    test("should throw [APIException] when the status code is not 200 or 201",
        () async {
      when(
        () => client.post(
          any(),
          body: any(named: "body"),
          headers: {
            "Content-Type": "application/json",
          },
        ),
      ).thenAnswer(
        (_) async => http.Response("Invalid email address", 400),
      );

      final methodCall = remoteDataSource.createUser;

      expect(
        () async => methodCall(
          createdAt: "createAt",
          name: "name",
          avatar: "avatar",
        ),
        throwsA(const ApiException(
          message: 'Invalid email address',
          statusCode: 400,
        )),
      );

      verify(() => client.post(
            Uri.https(kBaseUrl, kCreateUserEndpoint),
            body: jsonEncode({
              "createdAt": "createAt",
              "name": "name",
              "avatar": "avatar",
            }),
            headers: {
              "Content-Type": "application/json",
            },
          )).called(1);

      verifyNoMoreInteractions(client);
    });
  });

  group("getUsers", () {
    const tUsers = [UserModel.empty()];
    test('should return [List<UserModel>] when the status code is 200]',
        () async {
      when(
        () => client.get(any()),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode([tUsers.first.toMap()]), 200),
      );

      final result = await remoteDataSource.getUsers();

      expect(result, equals(tUsers));

      verify(
        () => client.get(Uri.https(kBaseUrl, kGetUserEndpoint)),
      ).called(1);

      verifyNoMoreInteractions(client);
    });

    test("should throw [APIException] when the status code is not 200",
        () async {
      when(
        () => client.get(any()),
      ).thenAnswer(
        (_) async => http.Response("Server down", 500),
      );

      final methodCall = remoteDataSource.getUsers;

      expect(
        () async => methodCall(),
        throwsA(const ApiException(
          message: 'Server down',
          statusCode: 500,
        )),
      );

      verify(
        () => client.get(Uri.https(kBaseUrl, kGetUserEndpoint)),
      ).called(1);

      verifyNoMoreInteractions(client);
    });
  });
}
