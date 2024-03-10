/// A BLoC (Business Logic Component) responsible for managing the weather-related state and events.
/// It handles fetching weather data for a city or location, updating weather data, and handling error events.
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/weather.dart';
import '../../domain/entities/weather_forecast.dart';
import '../../domain/usecases/fetch_city_weather.dart';
import '../../domain/usecases/fetch_location_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FetchCityWeather _fetchCityWeather;
  final FetchLocationWeather _fetchLocationWeather;
  final FetchCityForecast _fetchCityForecast;
  final FetchLocationForecast _fetchLocationForecast;
  int _retryCount = 0;

  WeatherBloc({
    required FetchCityWeather fetchCityWeather,
    required FetchLocationWeather fetchLocationWeather,
    required FetchCityForecast fetchCityForecast,
    required FetchLocationForecast fetchLocationForecast,
  })  : _fetchCityWeather = fetchCityWeather,
        _fetchLocationWeather = fetchLocationWeather,
        _fetchCityForecast = fetchCityForecast,
        _fetchLocationForecast = fetchLocationForecast,
        super(const WeatherInitial()) {
    on<FetchCityWeatherEvent>(_fetchCityWeatherHandler);
    on<FetchLocationWeatherEvent>(_fetchLocationWeatherHandler);
    on<UpdateWeatherEvent>(_updateWeatherHandler);
    on<NoInternetEvent>(_noInternetHandler);
    on<NoPermissionEvent>(_noPermissionHandler);
  }

  /// Handles the [FetchCityWeatherEvent] by fetching the weather data for a city.
  Future<void> _fetchCityWeatherHandler(
    FetchCityWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final WeatherLoaded? prevStatus =
        state is WeatherLoaded ? state as WeatherLoaded : null;

    emit(const FetchingWeather());

    final result = await _fetchCityWeather(
      event.cityName,
    );
    final forecast = await _fetchCityForecast(event.cityName);
// The fold method is used to handle the result of a function that returns an Either type.
// The first argument to fold is a function that handles the failure case (Left),
// and the second argument is a function that handles the success case (Right).
    result.fold(
        // If the result is a failure, this function is called.
        (failure) =>
            // Check if there was a previous status.
            prevStatus != null
                // If there was a previous status, emit a WeatherErrorWithData event.
                ? emit(WeatherErrorWithData(
                    prevStatus,
                    failure.errorMessage,
                  ))
                // If there was no previous status, emit a WeatherError event.
                : emit(WeatherError(failure.errorMessage)),
        // If the result is a success, this function is called.
        (weather) {
      // The forecast is also an Either type, so we use fold to handle it.
      forecast.fold(
        // If the forecast is a failure, emit a WeatherError event.
        (failure) => emit(WeatherError(failure.errorMessage)),
        // If the forecast is a success, emit a WeatherLoaded event with the city name, weather, and forecast.
        (forecast) => emit(
          WeatherLoaded(
            query: event.cityName,
            weather: weather,
            forecast: forecast,
          ),
        ),
      );
    });
  }

  /// Handles the [FetchLocationWeatherEvent] by fetching the weather data for a location.
  _fetchLocationWeatherHandler(
    FetchLocationWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    if (state is! WeatherLoaded) {
      emit(const FetchingWeather());
    }

    final LocationParams params = LocationParams(
      lat: event.lat,
      long: event.long,
    );

    final result = await _fetchLocationWeather(
      params,
    );
    final forecast = await _fetchLocationForecast(params);

    result.fold((failure) => emit(WeatherError(failure.errorMessage)),
        (weather) {
      forecast.fold(
        (failure) => emit(WeatherError(failure.errorMessage)),
        (forecast) => emit(
          WeatherLoaded(
            query: '${event.lat},${event.long}',
            weather: weather,
            forecast: forecast,
          ),
        ),
      );
    });
  }

  /// Handles the [UpdateWeatherEvent] by updating the weather data.
  FutureOr<void> _updateWeatherHandler(
      UpdateWeatherEvent event, Emitter<WeatherState> emit) async {
    final result = await _fetchCityWeather(event.query);
    result.fold(
      (failure) => _retryCount < 10
          ? _retryCount++
          : emit(WeatherError(failure.errorMessage)),
      (weather) {
        emit(
          WeatherLoaded(
            query: event.query,
            weather: weather,
            forecast: event.forecast,
          ),
        );
      },
    );
  }

  /// Handles the [NoInternetEvent] by emitting the appropriate state.
  FutureOr<void> _noInternetHandler(
      NoInternetEvent event, Emitter<WeatherState> emit) {
    if (state is WeatherLoaded) {
      emit(NoInternetWithData(
        state as WeatherLoaded,
      ));
    } else {
      emit(const NoInternet());
    }
  }

  FutureOr<void> _noPermissionHandler(
      NoPermissionEvent event, Emitter<WeatherState> emit) {
    emit(const NoPermission());
  }
}
