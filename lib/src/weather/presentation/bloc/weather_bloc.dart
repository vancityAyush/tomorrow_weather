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

    result.fold(
        (failure) => prevStatus != null
            ? emit(WeatherErrorWithData(
                prevStatus,
                failure.errorMessage,
              ))
            : emit(WeatherError(failure.errorMessage)), (weather) {
      forecast.fold(
        (failure) => emit(WeatherError(failure.errorMessage)),
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
