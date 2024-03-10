import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/weather.dart';
import '../../domain/usecases/fetch_city_weather.dart';
import '../../domain/usecases/fetch_location_weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final FetchCityWeather _fetchCityWeather;
  final FetchLocationWeather _fetchLocationWeather;

  WeatherBloc({
    required FetchCityWeather fetchCityWeather,
    required FetchLocationWeather fetchLocationWeather,
  })  : _fetchCityWeather = fetchCityWeather,
        _fetchLocationWeather = fetchLocationWeather,
        super(const WeatherInitial()) {
    on<FetchCityWeatherEvent>(_fetchCityWeatherHandler);
    on<FetchLocationWeatherEvent>(_fetchLocationWeatherHandler);
  }

  Future<void> _fetchCityWeatherHandler(
    FetchCityWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const FetchingWeather());

    final result = await _fetchCityWeather(
      event.cityName,
    );

    result.fold(
      (failure) => emit(WeatherError(failure.errorMessage)),
      (weather) => emit(WeatherLoaded(weather)),
    );
  }

  _fetchLocationWeatherHandler(
    FetchLocationWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const FetchingWeather());

    final result = await _fetchLocationWeather(
      LocationParams(
        lat: event.lat,
        long: event.long,
      ),
    );

    result.fold(
      (failure) => emit(WeatherError(failure.errorMessage)),
      (weather) => emit(WeatherLoaded(weather)),
    );
  }
}
