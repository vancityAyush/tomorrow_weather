import 'package:tomorrow_weather/core/utils/typedef.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather_forecast.dart';

import '../entities/weather.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  ResultFuture<Weather> fetchCityRealtimeWeather({
    required String cityName,
  });

  ResultFuture<Weather> fetchLocationWeatherRealtime({
    required String lat,
    required String long,
  });

  ResultFuture<WeatherForecast> fetchCityWeatherForecast({
    required String cityName,
  });

  ResultFuture<WeatherForecast> fetchLocationWeatherForecast({
    required String lat,
    required String long,
  });
}
