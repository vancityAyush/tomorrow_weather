import 'package:tomorrow_weather/core/utils/typedef.dart';

import '../entities/weather.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  ResultFuture<Weather> fetchCityWeather({
    required String cityName,
  });

  ResultFuture<Weather> fetchLocationWeather({
    required String lat,
    required String long,
  });
}
