// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      const DateTimeConverter().fromJson(json['time'] as String),
      WeatherData.fromJson(json['values'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'time': const DateTimeConverter().toJson(instance.time),
      'values': instance.values,
    };

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      cloudBase: json['cloudBase'] as num?,
      cloudCeiling: json['cloudCeiling'] as num?,
      cloudCover: json['cloudCover'] as num?,
      dewPoint: json['dewPoint'] as num?,
      freezingRainIntensity: json['freezingRainIntensity'] as num?,
      humidity: json['humidity'] as num?,
      precipitationProbability: json['precipitationProbability'] as num?,
      pressureSurfaceLevel: json['pressureSurfaceLevel'] as num?,
      rainIntensity: json['rainIntensity'] as num?,
      sleetIntensity: json['sleetIntensity'] as num?,
      snowIntensity: json['snowIntensity'] as num?,
      temperature: json['temperature'] as num?,
      temperatureApparent: json['temperatureApparent'] as num?,
      uvHealthConcern: json['uvHealthConcern'] as num?,
      uvIndex: json['uvIndex'] as num?,
      visibility: json['visibility'] as num?,
      weatherCode: json['weatherCode'] as num,
      windDirection: json['windDirection'] as num?,
      windGust: json['windGust'] as num?,
      windSpeed: json['windSpeed'] as num?,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'cloudBase': instance.cloudBase,
      'cloudCeiling': instance.cloudCeiling,
      'cloudCover': instance.cloudCover,
      'dewPoint': instance.dewPoint,
      'freezingRainIntensity': instance.freezingRainIntensity,
      'humidity': instance.humidity,
      'precipitationProbability': instance.precipitationProbability,
      'pressureSurfaceLevel': instance.pressureSurfaceLevel,
      'rainIntensity': instance.rainIntensity,
      'sleetIntensity': instance.sleetIntensity,
      'snowIntensity': instance.snowIntensity,
      'temperature': instance.temperature,
      'temperatureApparent': instance.temperatureApparent,
      'uvHealthConcern': instance.uvHealthConcern,
      'uvIndex': instance.uvIndex,
      'visibility': instance.visibility,
      'weatherCode': instance.weatherCode,
      'windDirection': instance.windDirection,
      'windGust': instance.windGust,
      'windSpeed': instance.windSpeed,
    };
