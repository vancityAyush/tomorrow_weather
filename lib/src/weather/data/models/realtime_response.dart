import 'dart:async';

import 'package:json_annotation/json_annotation.dart';
import 'package:tomorrow_weather/src/weather/data/models/location_model.dart';
import 'package:tomorrow_weather/src/weather/data/models/weather_model.dart';

part 'realtime_response.g.dart';

@JsonSerializable()
class RealtimeResponse {
  final WeatherModel data;
  final LocationModel location;

  RealtimeResponse(this.data, this.location);

  factory RealtimeResponse.fromJson(Map<String, dynamic> json) =>
      _$RealtimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RealtimeResponseToJson(this);
}

FutureOr<RealtimeResponse> deserializeRealtimeResponse(
        Map<String, dynamic> json) =>
    RealtimeResponse.fromJson(json);
FutureOr<dynamic> serializeRealtimeResponse(RealtimeResponse object) =>
    object.toJson();
