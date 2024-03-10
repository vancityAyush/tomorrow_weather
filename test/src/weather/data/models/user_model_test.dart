import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tomorrow_weather/core/utils/typedef.dart';
import 'package:tomorrow_weather/src/authentication/data/models/user_model.dart';
import 'package:tomorrow_weather/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  const testModel = UserModel.empty();

  test(
    "should be a subclass of [User] entity",
    () => {
      // assert
      expect(testModel, isA<User>())
    },
  );

  final tJson = fixture("user.json");
  final tMap = jsonDecode(tJson) as DataMap;

  group(
    'fromMap',
    () {
      test(
        "should return a [UserModel] with the right data",
        () {
          // act
          final result = UserModel.fromMap(tMap);
          expect(result, equals(testModel));
        },
      );
    },
  );

  group(
    'fromJson',
    () {
      test(
        "should return a [UserModel] with the right data",
        () {
          // act
          final result = UserModel.fromJson(tJson);
          expect(result, equals(testModel));
        },
      );
    },
  );

  group(
    'toMap',
    () {
      test(
        "should return a [Map] with the right data",
        () {
          // act
          final result = testModel.toMap();
          expect(result, equals(tMap));
        },
      );
    },
  );

  group(
    'toJson',
    () {
      test(
        "should return a [JSON] String with the right data",
        () {
          // act
          final result = testModel.toJson();
          final tJson = jsonEncode({
            "id": "_empty.id",
            "createdAt": "_empty.createdAt",
            "name": "_empty.name",
            "avatar": "_empty.avatar"
          });
          expect(result, tJson);
        },
      );
    },
  );

  group(
    'copyWith',
    () {
      test(
        "should return a [UserModel] with different data",
        () {
          // arrange
          final result = testModel.copyWith(name: "Minh");
          expect(result.name, equals("Minh"));
        },
      );
    },
  );
}
