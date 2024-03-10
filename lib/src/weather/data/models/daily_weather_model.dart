import 'package:json_annotation/json_annotation.dart';
import 'package:tomorrow_weather/core/utils/helpers/time_utils.dart';
import 'package:tomorrow_weather/src/weather/data/enums/weather_code.dart';

part 'daily_weather_model.g.dart';

@JsonSerializable()
class DailyWeatherModel {
  @DateTimeConverter()
  final DateTime time;
  final DailyWeatherValuesModel values;

  DailyWeatherModel(this.time, this.values);

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherModelToJson(this);
}

@JsonSerializable()
class DailyWeatherValuesModel {
  final double temperatureAvg;
  final double temperatureMax;
  final double temperatureMin;
  final WeatherCode weatherCodeMax;
  final WeatherCode weatherCodeMin;

  DailyWeatherValuesModel(this.temperatureAvg, this.temperatureMax,
      this.temperatureMin, this.weatherCodeMax, this.weatherCodeMin);

  factory DailyWeatherValuesModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherValuesModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherValuesModelToJson(this);
}
