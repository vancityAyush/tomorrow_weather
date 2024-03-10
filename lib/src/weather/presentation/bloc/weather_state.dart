part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class FetchingWeather extends WeatherState {
  const FetchingWeather();
}

class WeatherLoaded extends WeatherState {
  final String query;
  final Weather weather;
  final WeatherForecast forecast;
  const WeatherLoaded(
      {required this.query, required this.weather, required this.forecast});

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  List<String> get props => [message];
}

class NoInternet extends WeatherState {
  const NoInternet();
}

class WeatherErrorWithData extends WeatherLoaded {
  final String message;
  WeatherErrorWithData(WeatherLoaded state, this.message)
      : super(
            query: state.query,
            weather: state.weather,
            forecast: state.forecast);
}

class NoInternetWithData extends WeatherLoaded {
  NoInternetWithData(WeatherLoaded state)
      : super(
            query: state.query,
            weather: state.weather,
            forecast: state.forecast);
}

class NoPermission extends WeatherState {
  const NoPermission();
}
