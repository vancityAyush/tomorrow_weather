part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchCityWeatherEvent extends WeatherEvent {
  final String cityName;
  const FetchCityWeatherEvent({
    required this.cityName,
  });

  @override
  List<Object> get props => [cityName];
}

class FetchLocationWeatherEvent extends WeatherEvent {
  final String lat;
  final String long;
  const FetchLocationWeatherEvent({
    required this.lat,
    required this.long,
  });

  @override
  List<Object> get props => [lat, long];
}
