import 'dart:async';

import 'package:json_annotation/json_annotation.dart';
import 'package:tomorrow_weather/src/weather/data/models/daily_weather_model.dart';
import 'package:tomorrow_weather/src/weather/data/models/location_model.dart';
import 'package:tomorrow_weather/src/weather/data/models/weather_model.dart';

part 'forecast_response.g.dart';

@JsonSerializable()
class ForecastResponse {
  final ForecastTimelines timelines;
  final LocationModel location;

  ForecastResponse(this.timelines, this.location);

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);
}

@JsonSerializable()
class ForecastTimelines {
  final List<WeatherModel> minutely;
  final List<WeatherModel> hourly;
  final List<DailyWeatherModel> daily;

  ForecastTimelines(
    this.minutely,
    this.hourly,
    this.daily,
  );

  factory ForecastTimelines.fromJson(Map<String, dynamic> json) =>
      _$ForecastTimelinesFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastTimelinesToJson(this);
}

FutureOr<ForecastResponse> deserializeForecastResponse(
        Map<String, dynamic> json) =>
    ForecastResponse.fromJson(json);
FutureOr<dynamic> serializeForecastResponse(ForecastResponse object) =>
    object.toJson();

FutureOr<ForecastTimelines> deserializeForecastTimelines(
        Map<String, dynamic> json) =>
    ForecastTimelines.fromJson(json);
FutureOr<dynamic> serializeForecastTimelines(ForecastTimelines object) =>
    object.toJson();
