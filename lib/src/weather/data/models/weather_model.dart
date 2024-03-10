import 'dart:async';

import 'package:json_annotation/json_annotation.dart';
import 'package:tomorrow_weather/core/utils/helpers/time_utils.dart';

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
  final num? cloudBase;
  final num? cloudCeiling;
  final num? cloudCover;
  final num? dewPoint;
  final num? freezingRainIntensity;
  final num? humidity;
  final num? precipitationProbability;
  final num? pressureSurfaceLevel;
  final num? rainIntensity;
  final num? sleetIntensity;
  final num? snowIntensity;
  final num? temperature;
  final num? temperatureApparent;
  final num? uvHealthConcern;
  final num? uvIndex;
  final num? visibility;
  final num weatherCode;
  final num? windDirection;
  final num? windGust;
  final num? windSpeed;

  WeatherData(
      {this.cloudBase,
      this.cloudCeiling,
      this.cloudCover,
      this.dewPoint,
      this.freezingRainIntensity,
      this.humidity,
      this.precipitationProbability,
      this.pressureSurfaceLevel,
      this.rainIntensity,
      this.sleetIntensity,
      this.snowIntensity,
      this.temperature,
      this.temperatureApparent,
      this.uvHealthConcern,
      this.uvIndex,
      this.visibility,
      required this.weatherCode,
      this.windDirection,
      this.windGust,
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
