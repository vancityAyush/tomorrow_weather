import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tomorrow_weather/core/errors/exceptions.dart';
import 'package:tomorrow_weather/core/errors/failure.dart';
import 'package:tomorrow_weather/core/utils/typedef.dart';
import 'package:tomorrow_weather/src/weather/data/datasources/tomorrow_io_weather_client.dart';
import 'package:tomorrow_weather/src/weather/data/models/error_response.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather.dart';
import 'package:tomorrow_weather/src/weather/domain/repositories/weather_repository.dart';

const apiKey = "grCTeej8ilUYtXGGGwRKgY8F4xN0WUSG";

class WeatherRepositoryImpl implements WeatherRepository {
  final TomorrowIoWeatherClient _remoteDataSource;

  WeatherRepositoryImpl(this._remoteDataSource);

  // Test-Driven Development (TDD)
  // call the remote data source
  // make sure that it returns the proper date if there is no exception
  // check if the mothod returns the proper data
  // check if when the remoteDataSource throws an exception, we return a failure
  // and if it doesn't throw an exception, we return a success data

  @override
  ResultFuture<Weather> fetchCityWeather({required String cityName}) async {
    try {
      final res2 = await _remoteDataSource.getWeatherForecast(
          location: cityName, apiKey: apiKey);
      final result = await _remoteDataSource.getCurrentWeather(
          location: cityName, apiKey: apiKey);
      Weather weather = Weather(
        temp: result.data.values.temperature ?? 0,
        description: "Hello",
        main: "Hello",
        name: "Hello",
      );
      return Right(weather);
    } on DioException catch (e) {
      ErrorResponse errorResponse = ErrorResponse.fromJson(e.response!.data);
      return Left(
        ApiFailure.fromException(
          ApiException(
            message: errorResponse.type,
            statusCode: e.response?.statusCode ?? 505,
          ),
        ),
      );
    }
  }

  @override
  ResultFuture<Weather> fetchLocationWeather(
      {required String lat, required String long}) async {
    try {
      final result = await _remoteDataSource.getCurrentWeather(
          location: "$lat,$long", apiKey: apiKey);
      Weather weather = Weather(
        temp: result.data.values.temperature ?? 0,
        description: "Hello",
        main: "Hello",
        name: "Hello",
      );
      return Right(weather);
    } on DioException catch (e) {
      ErrorResponse errorResponse = ErrorResponse.fromJson(e.response!.data);
      return Left(
        ApiFailure.fromException(
          ApiException(
            message: errorResponse.type,
            statusCode: e.response?.statusCode ?? 505,
          ),
        ),
      );
    }
  }
}
