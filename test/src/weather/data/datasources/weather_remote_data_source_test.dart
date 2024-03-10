import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tomorrow_weather/core/errors/exceptions.dart';
import 'package:tomorrow_weather/src/weather/data/datasources/weather_remote_data_source.dart';

import '../../../../fixtures/fixtures_reader.dart';

class MockClient extends Mock implements Dio {}

void main() {
  late Dio client;
  late OpenApiRemoteDataSrcImpl remoteDataSource;

  setUp(() {
    client = MockClient();
    remoteDataSource = OpenApiRemoteDataSrcImpl(client);
    registerFallbackValue(Uri());
  });

  //write a test to test fetchCityWeather
  group("fetchCityWeather", () {
    test('should complete successfully when the status code is 200 or 201',
        () async {
      when(
        () => client.get(
          any(),
          queryParameters: any(named: "queryParameters"),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: jsonDecode(fixture("weather.json")),
          statusCode: 200,
          requestOptions: RequestOptions(path: ""),
        ),
      );

      final methodCall = remoteDataSource.fetchCityWeather;

      expect(
          methodCall(
            cityName: "cityName",
          ),
          completes);

      verify(() => client.get(
            kOpenWeatherBaseUrl,
            queryParameters: {
              "q": "cityName",
              "appid": kOpenWeatherMapApiKey,
            },
          )).called(1);

      verifyNoMoreInteractions(client);
    });

    test('should throw an exception when the status code is not 200 or 201',
        () async {
      when(
        () => client.get(
          any(),
          queryParameters: any(named: "queryParameters"),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: jsonDecode(fixture("weather.json")),
          statusCode: 400,
          requestOptions: RequestOptions(path: ""),
        ),
      );

      final methodCall = remoteDataSource.fetchCityWeather;

      expect(
          methodCall(
            cityName: "cityName",
          ),
          throwsA(isA<ApiException>()));

      verify(() => client.get(
            kOpenWeatherBaseUrl,
            queryParameters: {
              "q": "cityName",
              "appid": kOpenWeatherMapApiKey,
            },
          )).called(1);

      verifyNoMoreInteractions(client);
    });
  });

  //write a test to test fetchLocationWeather
  group("fetchLocationWeather", () {
    test('should complete successfully when the status code is 200 or 201',
        () async {
      when(
        () => client.get(
          any(),
          queryParameters: any(named: "queryParameters"),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: jsonDecode(fixture("weather.json")),
          statusCode: 200,
          requestOptions: RequestOptions(path: ""),
        ),
      );

      final methodCall = remoteDataSource.fetchLocationWeather;

      expect(
          methodCall(
            lat: "lat",
            long: "long",
          ),
          completes);

      verify(() => client.get(
            kOpenWeatherBaseUrl,
            queryParameters: {
              "lat": "lat",
              "lon": "long",
              "appid": kOpenWeatherMapApiKey,
            },
          )).called(1);

      verifyNoMoreInteractions(client);
    });

    test('should throw an exception when the status code is not 200 or 201',
        () async {
      when(
        () => client.get(
          any(),
          queryParameters: any(named: "queryParameters"),
        ),
      ).thenAnswer(
        (_) async => Response(
          data: jsonDecode(fixture("weather.json")),
          statusCode: 400,
          requestOptions: RequestOptions(path: ""),
        ),
      );

      final methodCall = remoteDataSource.fetchLocationWeather;

      expect(
          methodCall(
            lat: "lat",
            long: "long",
          ),
          throwsA(isA<ApiException>()));

      verify(() => client.get(
            kOpenWeatherBaseUrl,
            queryParameters: {
              "lat": "lat",
              "lon": "long",
              "appid": kOpenWeatherMapApiKey,
            },
          )).called(1);

      verifyNoMoreInteractions(client);
    });
  });
}
