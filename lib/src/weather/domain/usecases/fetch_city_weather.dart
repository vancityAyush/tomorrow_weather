import 'package:tomorrow_weather/core/usecase/usecase.dart';
import 'package:tomorrow_weather/core/utils/typedef.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather_forecast.dart';
import 'package:tomorrow_weather/src/weather/domain/repositories/weather_repository.dart';

class FetchCityWeather extends UsecaseWithParams<Weather, String> {
  const FetchCityWeather(this._repository);

  final WeatherRepository _repository;

  @override
  ResultFuture<Weather> call(String cityName) async =>
      _repository.fetchCityRealtimeWeather(
        cityName: cityName,
      );
}

class FetchCityForecast extends UsecaseWithParams<WeatherForecast, String> {
  const FetchCityForecast(this._repository);

  final WeatherRepository _repository;

  @override
  ResultFuture<WeatherForecast> call(String cityName) async =>
      _repository.fetchCityWeatherForecast(
        cityName: cityName,
      );
}
