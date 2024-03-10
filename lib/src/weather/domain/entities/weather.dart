import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather(
      {required String address,
      required num temperature,
      required num main,
      required num feelsLike,
      required num humidity,
      required num windSpeed,
      required num windDirection,
      required num visibility,
      required String iconPath}) = _Weather;

  factory Weather.empty() => const Weather(
        address: 'Unknown',
        temperature: 0,
        main: 0,
        feelsLike: 0,
        humidity: 0,
        windSpeed: 0,
        windDirection: 0,
        visibility: 0,
        iconPath: 'Unknown',
      );
}
