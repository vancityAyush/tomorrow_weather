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
      humidity: json['humidity'] as num?,
      precipitationProbability: json['precipitationProbability'] as num?,
      temperature: json['temperature'] as num?,
      temperatureApparent: json['temperatureApparent'] as num?,
      uvIndex: json['uvIndex'] as num?,
      visibility: json['visibility'] as num?,
      weatherCode: $enumDecode(_$WeatherCodeEnumMap, json['weatherCode']),
      windDirection: json['windDirection'] as num?,
      windSpeed: json['windSpeed'] as num?,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'humidity': instance.humidity,
      'precipitationProbability': instance.precipitationProbability,
      'temperature': instance.temperature,
      'temperatureApparent': instance.temperatureApparent,
      'uvIndex': instance.uvIndex,
      'visibility': instance.visibility,
      'weatherCode': _$WeatherCodeEnumMap[instance.weatherCode]!,
      'windDirection': instance.windDirection,
      'windSpeed': instance.windSpeed,
    };

const _$WeatherCodeEnumMap = {
  WeatherCode.unknown: 0,
  WeatherCode.clearSunny: 1000,
  WeatherCode.mostlyClear: 1100,
  WeatherCode.partlyCloudy: 1101,
  WeatherCode.mostlyCloudy: 1102,
  WeatherCode.cloudy: 1001,
  WeatherCode.fog: 2000,
  WeatherCode.lightFog: 2100,
  WeatherCode.drizzle: 4000,
  WeatherCode.rain: 4001,
  WeatherCode.lightRain: 4200,
  WeatherCode.heavyRain: 4201,
  WeatherCode.snow: 5000,
  WeatherCode.flurries: 5001,
  WeatherCode.lightSnow: 5100,
  WeatherCode.heavySnow: 5101,
  WeatherCode.freezingDrizzle: 6000,
  WeatherCode.freezingRain: 6001,
  WeatherCode.lightFreezingRain: 6200,
  WeatherCode.heavyFreezingRain: 6201,
  WeatherCode.icePellets: 7000,
  WeatherCode.heavyIcePellets: 7101,
  WeatherCode.lightIcePellets: 7102,
  WeatherCode.thunderstorm: 8000,
};
