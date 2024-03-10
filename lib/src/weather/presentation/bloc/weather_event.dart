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

class UpdateWeatherEvent extends WeatherEvent {
  final String query;
  final WeatherForecast forecast;
  const UpdateWeatherEvent({
    required this.query,
    required this.forecast,
  });

  @override
  List<Object> get props => [query, forecast];
}

class NoInternetEvent extends WeatherEvent {
  const NoInternetEvent();
}

class NoPermissionEvent extends WeatherEvent {
  const NoPermissionEvent();
}
