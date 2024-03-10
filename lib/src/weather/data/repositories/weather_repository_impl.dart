import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tomorrow_weather/core/errors/exceptions.dart';
import 'package:tomorrow_weather/core/errors/failure.dart';
import 'package:tomorrow_weather/core/services/location_service.dart';
import 'package:tomorrow_weather/core/utils/constants.dart';
import 'package:tomorrow_weather/core/utils/typedef.dart';
import 'package:tomorrow_weather/src/weather/data/datasources/tomorrow_io_weather_client.dart';
import 'package:tomorrow_weather/src/weather/data/models/error_response.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/daily_weather.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather_forecast.dart';
import 'package:tomorrow_weather/src/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final TomorrowIoWeatherClient _remoteDataSource;
  final LocationService locationService = LocationService.instance;

  WeatherRepositoryImpl(this._remoteDataSource);

  @override
  ResultFuture<Weather> fetchCityRealtimeWeather(
      {required String cityName}) async {
    try {
      final result = await _remoteDataSource.getRealtimeWeather(
          location: cityName, apiKey: kApiKey);

      String address = result.location.name ??
          await locationService.getCityAndState(
              lat: result.location.lat.toDouble(),
              long: result.location.lon.toDouble());
      Weather weather = Weather(
        address: address,
        temperature: result.data.values.temperature ?? 0,
        feelsLike: result.data.values.temperatureApparent ?? 0,
        humidity: result.data.values.humidity ?? 0,
        windSpeed: result.data.values.windSpeed ?? 0,
        windDirection: result.data.values.windDirection ?? 0,
        visibility: result.data.values.visibility ?? 0,
        main: result.data.values.weatherCode.weatherCode,
        iconPath: result.data.values.weatherCode.lottieFile,
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
    } catch (e) {
      return Left(
        ApiFailure.fromException(
          ApiException(
            message: e.toString(),
            statusCode: 505,
          ),
        ),
      );
    }
  }

  @override
  ResultFuture<Weather> fetchLocationWeatherRealtime(
      {required String lat, required String long}) async {
    try {
      final result = await _remoteDataSource.getRealtimeWeather(
          location: "$lat,$long", apiKey: kApiKey);
      String? cityName = await locationService.getCityAndState(
          lat: result.location.lat.toDouble(),
          long: result.location.lon.toDouble());
      Weather weather = Weather(
        address: cityName ?? "Unknown",
        temperature: result.data.values.temperature ?? 0,
        feelsLike: result.data.values.temperatureApparent ?? 0,
        humidity: result.data.values.humidity ?? 0,
        windSpeed: result.data.values.windSpeed ?? 0,
        windDirection: result.data.values.windDirection ?? 0,
        visibility: result.data.values.visibility ?? 0,
        main: result.data.values.weatherCode.weatherCode,
        iconPath: result.data.values.weatherCode.lottieFile,
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
    } catch (e) {
      return Left(
        ApiFailure.fromException(
          ApiException(
            message: e.toString(),
            statusCode: 505,
          ),
        ),
      );
    }
  }

  @override
  ResultFuture<WeatherForecast> fetchCityWeatherForecast(
      {required String cityName}) async {
    try {
      final result = await _remoteDataSource.getWeatherForecast(
          location: cityName, apiKey: kApiKey);
      List<WeatherForecastModel> hourly = result.timelines.hourly
          .map((e) => WeatherForecastModel(
                date: e.time,
                temperature: e.values.temperature ?? 0,
                icon: e.values.weatherCode.lottieFile,
              ))
          .toList();
      List<DailyWeather> daily = result.timelines.daily
          .map((e) => DailyWeather(
                time: e.time,
                temperatureMin: e.values.temperatureMin ?? 0,
                temperatureAvg: e.values.temperatureAvg ?? 0,
                temperatureMax: e.values.temperatureMax ?? 0,
                icon: e.values.weatherCodeMax.lottieFile,
              ))
          .toList();

      return Right(
        WeatherForecast(
          hourly: hourly,
          daily: daily,
        ),
      );
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
    } catch (e) {
      return Left(
        ApiFailure.fromException(
          ApiException(
            message: e.toString(),
            statusCode: 505,
          ),
        ),
      );
    }
  }

  @override
  ResultFuture<WeatherForecast> fetchLocationWeatherForecast(
      {required String lat, required String long}) async {
    return fetchCityWeatherForecast(cityName: "$lat,$long");
  }
}
