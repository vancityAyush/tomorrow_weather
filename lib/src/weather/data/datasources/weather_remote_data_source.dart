import 'dart:async';

import 'package:dio/dio.dart';
import 'package:tomorrow_weather/core/errors/exceptions.dart';
import 'package:tomorrow_weather/src/weather/data/models/open_weather_model.dart';

import '../../domain/entities/weather.dart';

abstract class WeatherRemoteDataSource {
  Future<Weather> fetchCityWeather({
    required String cityName,
  });

  Future<Weather> fetchLocationWeather({
    required String lat,
    required String long,
  });
}

const kOpenWeatherBaseUrl = 'https://api.openweathermap.org/data/2.5/weather';
const kOpenWeatherMapApiKey = '31d0f2f212f57d850e7150a0999d6602';

class OpenApiRemoteDataSrcImpl implements WeatherRemoteDataSource {
  final Dio _client;

  OpenApiRemoteDataSrcImpl(this._client);

  @override
  Future<Weather> fetchCityWeather({required String cityName}) async {
    // 1. check to make sure that it returns the right data when the response code is 200 or the proper response code
    // 2. check to make sure that it throws an exception when the response code is not bad one
    try {
      final response = await _client.get(
        kOpenWeatherBaseUrl,
        queryParameters: {
          "q": cityName,
          "appid": kOpenWeatherMapApiKey,
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ApiException(
          message: response.data.toString(),
          statusCode: response.statusCode ?? 505,
        );
      }

      return OpenWeatherModel.fromMap(response.data);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<Weather> fetchLocationWeather(
      {required String lat, required String long}) async {
    // 1. check to make sure that it returns the right data when the response code is 200 or the proper response code
    // 2. check to make sure that it throws an exception when the response code is not bad one
    try {
      final response = await _client.get(
        kOpenWeatherBaseUrl,
        queryParameters: {
          "lat": lat,
          "lon": long,
          "appid": kOpenWeatherMapApiKey,
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ApiException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode ?? 505,
        );
      }
      return OpenWeatherModel.fromMap(response.data);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
