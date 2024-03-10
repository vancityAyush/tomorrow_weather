import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tomorrow_weather/core/services/location_service.dart';
import 'package:tomorrow_weather/core/utils/connectivity/connectivity_helper.dart';
import 'package:tomorrow_weather/src/authentication/data/datasources/authenrication_remote_data_source.dart';
import 'package:tomorrow_weather/src/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:tomorrow_weather/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tomorrow_weather/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:tomorrow_weather/src/weather/data/datasources/tomorrow_io_weather_client.dart';
import 'package:tomorrow_weather/src/weather/domain/repositories/weather_repository.dart';
import 'package:tomorrow_weather/src/weather/presentation/bloc/weather_bloc.dart';

import '../src/authentication/domain/usecases/create_user.dart';
import '../src/authentication/domain/usecases/get_user.dart';
import '../src/weather/data/repositories/weather_repository_impl.dart';
import '../src/weather/domain/usecases/fetch_city_weather.dart';
import '../src/weather/domain/usecases/fetch_location_weather.dart';

final sl = GetIt.instance;

initApp() async {
  await EasyLocalization.ensureInitialized();

  await loadDependencies();

  // Get current or last fetched location
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse) {
    LocationService.instance.getCurrentOrLastKnownPosition();
  } else if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  await ConnectivityHelper.instance.init();
}

Future<void> loadDependencies() async {
  sl
    // app logic
    ..registerFactory(
      () => AuthenticationCubit(createUser: sl(), getUsers: sl()),
    )
    // use cases
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => GetUsers(sl()))
    // repositories
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()),
    )
    // data sources
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthRemoteDataSrcImpl(sl()),
    )
    // external dependencies
    ..registerLazySingleton(http.Client.new);

  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
  ));

  sl
    ..registerFactory(
        () => WeatherBloc(fetchCityWeather: sl(), fetchLocationWeather: sl()))
    ..registerLazySingleton(() => FetchCityWeather(sl()))
    ..registerLazySingleton(() => FetchLocationWeather(sl()))
    ..registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(sl()))
    ..registerLazySingleton<TomorrowIoWeatherClient>(
        () => TomorrowIoWeatherClient(sl()))
    ..registerLazySingleton(() => dio);
}
