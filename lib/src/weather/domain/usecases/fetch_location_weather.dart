import 'package:tomorrow_weather/core/usecase/usecase.dart';
import 'package:tomorrow_weather/core/utils/typedef.dart';
import 'package:tomorrow_weather/src/weather/domain/entities/weather.dart';
import 'package:tomorrow_weather/src/weather/domain/repositories/weather_repository.dart';

class FetchLocationWeather extends UsecaseWithParams<Weather, LocationParams> {
  const FetchLocationWeather(this._repository);

  final WeatherRepository _repository;

  @override
  ResultFuture<Weather> call(LocationParams params) async =>
      _repository.fetchLocationWeather(
        lat: params.lat,
        long: params.long,
      );
}

class LocationParams {
  final String lat;
  final String long;

  const LocationParams({
    required this.lat,
    required this.long,
  });

  const LocationParams.empty()
      : this(
          lat: "_empty.lat",
          long: "_empty.long",
        );
}
