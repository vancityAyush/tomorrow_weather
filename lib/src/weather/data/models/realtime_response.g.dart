// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealtimeResponse _$RealtimeResponseFromJson(Map<String, dynamic> json) =>
    RealtimeResponse(
      WeatherModel.fromJson(json['data'] as Map<String, dynamic>),
      LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RealtimeResponseToJson(RealtimeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'location': instance.location,
    };
