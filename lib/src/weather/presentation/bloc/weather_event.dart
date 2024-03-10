part of 'weather_bloc.dart';

/// Base class for all weather events.
/// Extends [Equatable] for easy equality comparisons.
sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch weather data for a specific city.
/// [cityName] is the name of the city for which weather data is to be fetched.
class FetchCityWeatherEvent extends WeatherEvent {
  final String cityName;
  const FetchCityWeatherEvent({
    required this.cityName,
  });

  @override
  List<Object> get props => [cityName];
}

/// Event to fetch weather data for a specific location.
/// [lat] is the latitude of the location.
/// [long] is the longitude of the location.
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

/// Event to update weather data based on a query.
/// [query] is the search query for weather data.
/// [forecast] is the updated weather forecast.
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

/// Event indicating no internet connection.
class NoInternetEvent extends WeatherEvent {
  const NoInternetEvent();
}

/// Event indicating no permission to access location.
class NoPermissionEvent extends WeatherEvent {
  const NoPermissionEvent();
}
