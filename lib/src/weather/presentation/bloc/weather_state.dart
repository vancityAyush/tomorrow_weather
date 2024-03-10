/// This file contains the definition of various weather states used in the WeatherBloc.
/// The WeatherState class is an abstract class that serves as the base class for all weather states.
/// It extends the Equatable class to enable easy comparison of state objects.
/// 
/// The WeatherInitial class represents the initial state of the WeatherBloc.
/// 
/// The FetchingWeather class represents the state when the weather data is being fetched.
/// 
/// The WeatherLoaded class represents the state when the weather data has been successfully loaded.
/// It contains the query, weather, and forecast objects.
/// 
/// The WeatherError class represents the state when an error occurs while fetching weather data.
/// It contains an error message.
/// 
/// The NoInternet class represents the state when there is no internet connection.
/// 
/// The WeatherErrorWithData class represents the state when an error occurs while fetching weather data,
/// but there is already some data available.
/// It extends the WeatherLoaded class and contains an error message.
/// 
/// The NoInternetWithData class represents the state when there is no internet connection,
/// but there is already some data available.
/// It extends the WeatherLoaded class.
/// 
/// The NoPermission class represents the state when the app does not have the necessary permissions.
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
