import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

enum UnitType {
  @JsonValue('metric')
  metric,
  @JsonValue('imperial')
  imperial;

  String get value {
    switch (this) {
      case UnitType.metric:
        return 'metric';
      case UnitType.imperial:
        return 'imperial';
    }
  }

  factory UnitType.fromJson(Map<String, dynamic> json) {
    switch (json['unitType']) {
      case 'metric':
        return UnitType.metric;
      case 'imperial':
        return UnitType.imperial;
    }
    throw Exception('Unknown unit type');
  }

  String toJson() => value;
}

FutureOr<UnitType> deserializeUnitType(Map<String, dynamic> json) =>
    UnitType.fromJson(json);
FutureOr<dynamic> serializeUnitType(UnitType object) => object.toJson();
