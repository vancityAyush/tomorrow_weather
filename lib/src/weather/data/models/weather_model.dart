import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tomorrow_weather/core/utils/helpers/time_utils.dart';
import 'package:tomorrow_weather/src/weather/data/enums/weather_code.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  @DateTimeConverter()
  final DateTime time;
  final WeatherData values;

  WeatherModel(this.time, this.values);

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class WeatherData {
  final num? humidity;
  final num? precipitationProbability;
  final num? temperature;
  final num? temperatureApparent;
  final num? uvIndex;
  final num? visibility;
  final WeatherCode weatherCode;
  final num? windDirection;
  final num? windSpeed;

  WeatherData(
      {this.humidity,
      this.precipitationProbability,
      this.temperature,
      this.temperatureApparent,
      this.uvIndex,
      this.visibility,
      required this.weatherCode,
      this.windDirection,
      this.windSpeed});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

FutureOr<WeatherModel> deserializeWeatherModel(Map<String, dynamic> json) =>
    WeatherModel.fromJson(json);
FutureOr<dynamic> serializeWeatherModel(WeatherModel object) => object.toJson();

FutureOr<WeatherData> deserializeWeatherData(Map<String, dynamic> json) =>
    WeatherData.fromJson(json);
FutureOr<dynamic> serializeWeatherData(WeatherData object) => object.toJson();
