import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_weather.freezed.dart';

@freezed
class DailyWeather with _$DailyWeather {
  const factory DailyWeather({
    required DateTime time,
    required num temperatureAvg,
    required num temperatureMin,
    required num temperatureMax,
    required String icon,
  }) = _DailyWeather;
}
