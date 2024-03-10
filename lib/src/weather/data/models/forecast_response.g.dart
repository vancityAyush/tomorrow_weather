// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) =>
    ForecastResponse(
      ForecastTimelines.fromJson(json['timelines'] as Map<String, dynamic>),
      LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastResponseToJson(ForecastResponse instance) =>
    <String, dynamic>{
      'timelines': instance.timelines,
      'location': instance.location,
    };

ForecastTimelines _$ForecastTimelinesFromJson(Map<String, dynamic> json) =>
    ForecastTimelines(
      (json['minutely'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['hourly'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['daily'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastTimelinesToJson(ForecastTimelines instance) =>
    <String, dynamic>{
      'minutely': instance.minutely,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
