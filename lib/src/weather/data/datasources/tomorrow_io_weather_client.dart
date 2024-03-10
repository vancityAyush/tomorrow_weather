import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tomorrow_weather/src/weather/data/enums/unit_type.dart';
import 'package:tomorrow_weather/src/weather/data/models/forecast_response.dart';
import 'package:tomorrow_weather/src/weather/data/models/realtime_response.dart';

part 'tomorrow_io_weather_client.g.dart';

@RestApi(
  baseUrl: "https://api.tomorrow.io/v4",
  parser: Parser.FlutterCompute,
)
abstract class TomorrowIoWeatherClient {
  factory TomorrowIoWeatherClient(Dio dio, {String baseUrl}) =
      _TomorrowIoWeatherClient;

  @GET("/weather/realtime")
  Future<RealtimeResponse> getRealtimeWeather({
    @Query("location") required String location,
    @Query("units") UnitType unitType = UnitType.metric,
    @Query("apikey") required String apiKey,
  });

  @GET("/weather/forecast")
  Future<ForecastResponse> getWeatherForecast({
    @Query("location") required String location,
    @Query("units") UnitType unitType = UnitType.metric,
    @Query("apikey") required String apiKey,
  });
}
