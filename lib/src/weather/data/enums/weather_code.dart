import 'package:json_annotation/json_annotation.dart';
import 'package:tomorrow_weather/gen/assets.gen.dart';

@JsonEnum(valueField: 'weatherCode')
enum WeatherCode {
  unknown(0),
  clearSunny(1000),
  mostlyClear(1100),
  partlyCloudy(1101),
  mostlyCloudy(1102),
  cloudy(1001),
  fog(2000),
  lightFog(2100),
  drizzle(4000),
  rain(4001),
  lightRain(4200),
  heavyRain(4201),
  snow(5000),
  flurries(5001),
  lightSnow(5100),
  heavySnow(5101),
  freezingDrizzle(6000),
  freezingRain(6001),
  lightFreezingRain(6200),
  heavyFreezingRain(6201),
  icePellets(7000),
  heavyIcePellets(7101),
  lightIcePellets(7102),
  thunderstorm(8000);

  const WeatherCode(this.weatherCode);
  final int weatherCode;

  String get lottieFile {
    switch (this) {
      case WeatherCode.unknown:
        return Assets.lottie.unknown.path;
      case WeatherCode.clearSunny:
        return Assets.lottie.clearSunny.path;
      case WeatherCode.mostlyClear:
        return Assets.lottie.sunny.path;
      case WeatherCode.partlyCloudy:
        return Assets.lottie.partlyCloudy.path;
      case WeatherCode.mostlyCloudy:
      case WeatherCode.cloudy:
        return Assets.lottie.cloudy.path;
      case WeatherCode.fog:
        return Assets.lottie.fog.path;
      case WeatherCode.lightFog:
        return Assets.lottie.lightFog.path;
      case WeatherCode.drizzle:
      case WeatherCode.lightRain:
        return Assets.lottie.drizzle.path;
      case WeatherCode.rain:
      case WeatherCode.heavyRain:
        return Assets.lottie.heavyRain.path;
      case WeatherCode.snow:
      case WeatherCode.flurries:
      case WeatherCode.lightSnow:
        return Assets.lottie.lightSnow.path;
      case WeatherCode.heavySnow:
        return Assets.lottie.snow.path;
      case WeatherCode.freezingDrizzle:
      case WeatherCode.freezingRain:
      case WeatherCode.lightFreezingRain:
      case WeatherCode.heavyFreezingRain:
        return Assets.lottie.thunderstorm.path;
      default:
        return Assets.lottie.unknown.path;
    }
  }
}

// "0": "Unknown",
// "1000": "Clear, Sunny",
// "1100": "Mostly Clear",
// "1101": "Partly Cloudy",
// "1102": "Mostly Cloudy",
// "1001": "Cloudy",
// "2000": "Fog",
// "2100": "Light Fog",
// "4000": "Drizzle",
// "4001": "Rain",
// "4200": "Light Rain",
// "4201": "Heavy Rain",
// "5000": "Snow",
// "5001": "Flurries",
// "5100": "Light Snow",
// "5101": "Heavy Snow",
// "6000": "Freezing Drizzle",
// "6001": "Freezing Rain",
// "6200": "Light Freezing Rain",
// "6201": "Heavy Freezing Rain",
// "7000": "Ice Pellets",
// "7101": "Heavy Ice Pellets",
// "7102": "Light Ice Pellets",
// "8000": "Thunderstorm"
