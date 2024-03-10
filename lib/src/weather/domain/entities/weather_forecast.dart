import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/daily_weather.dart';

part 'weather_forecast.freezed.dart';

@freezed
class WeatherForecast with _$WeatherForecast {
  const factory WeatherForecast({
    required List<WeatherForecastModel> hourly,
    required List<DailyWeather> daily,
  }) = _WeatherForecast;

  factory WeatherForecast.empty() => const WeatherForecast(
        hourly: [],
        daily: [],
      );
}

@freezed
class WeatherForecastModel with _$WeatherForecastModel {
  const factory WeatherForecastModel({
    required DateTime date,
    required num temperature,
    required String icon,
  }) = _WeatherForecastModel;
}
