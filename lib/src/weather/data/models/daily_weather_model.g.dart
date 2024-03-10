// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeatherModel _$DailyWeatherModelFromJson(Map<String, dynamic> json) =>
    DailyWeatherModel(
      const DateTimeConverter().fromJson(json['time'] as String),
      DailyWeatherValuesModel.fromJson(json['values'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DailyWeatherModelToJson(DailyWeatherModel instance) =>
    <String, dynamic>{
      'time': const DateTimeConverter().toJson(instance.time),
      'values': instance.values,
    };

DailyWeatherValuesModel _$DailyWeatherValuesModelFromJson(
        Map<String, dynamic> json) =>
    DailyWeatherValuesModel(
      (json['temperatureAvg'] as num).toDouble(),
      (json['temperatureMax'] as num).toDouble(),
      (json['temperatureMin'] as num).toDouble(),
      $enumDecode(_$WeatherCodeEnumMap, json['weatherCodeMax']),
      $enumDecode(_$WeatherCodeEnumMap, json['weatherCodeMin']),
    );

Map<String, dynamic> _$DailyWeatherValuesModelToJson(
        DailyWeatherValuesModel instance) =>
    <String, dynamic>{
      'temperatureAvg': instance.temperatureAvg,
      'temperatureMax': instance.temperatureMax,
      'temperatureMin': instance.temperatureMin,
      'weatherCodeMax': _$WeatherCodeEnumMap[instance.weatherCodeMax]!,
      'weatherCodeMin': _$WeatherCodeEnumMap[instance.weatherCodeMin]!,
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
