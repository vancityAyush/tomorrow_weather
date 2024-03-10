import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tomorrow_weather/core/services/location_service.dart';
import 'package:tomorrow_weather/core/utils/connectivity/connectivity_helper.dart';
import 'package:tomorrow_weather/src/weather/data/datasources/tomorrow_io_weather_client.dart';
import 'package:tomorrow_weather/src/weather/data/repositories/weather_repository_impl.dart';
import 'package:tomorrow_weather/src/weather/domain/repositories/weather_repository.dart';
import 'package:tomorrow_weather/src/weather/domain/usecases/fetch_city_weather.dart';
import 'package:tomorrow_weather/src/weather/domain/usecases/fetch_location_weather.dart';
import 'package:tomorrow_weather/src/weather/presentation/bloc/weather_bloc.dart';

//Service Locator using GetIt
final sl = GetIt.instance;

/// Initializes the application.
///
/// This function ensures that EasyLocalization is initialized and then loads the dependencies required by the application.
/// It also initializes the [LocationService] and [ConnectivityHelper] to get the current or last fetched location and handle connectivity.
initApp() async {
  await EasyLocalization.ensureInitialized();

  await loadDependencies();

  // Get current or last fetched location
  await LocationService.instance.init();
  await ConnectivityHelper.instance.init();
}

/// Loads the dependencies required by the application.
///
/// This function registers the necessary dependencies using the [GetIt] service locator.
/// It creates an instance of [Dio] and adds a [PrettyDioLogger] interceptor for logging network requests and responses.
/// It also registers the various use cases, repositories, and clients required by the application.
Future<void> loadDependencies() async {
  final dio = Dio();
  if (kDebugMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
  }

  sl
    ..registerFactory(() => WeatherBloc(
          fetchCityWeather: sl(),
          fetchLocationWeather: sl(),
          fetchCityForecast: sl(),
          fetchLocationForecast: sl(),
        ))
    ..registerLazySingleton(() => FetchCityWeather(sl()))
    ..registerLazySingleton(() => FetchLocationWeather(sl()))
    ..registerLazySingleton(() => FetchCityForecast(sl()))
    ..registerLazySingleton(() => FetchLocationForecast(sl()))
    ..registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(sl()))
    ..registerLazySingleton<TomorrowIoWeatherClient>(
        () => TomorrowIoWeatherClient(sl()))
    ..registerLazySingleton(() => dio);
}
