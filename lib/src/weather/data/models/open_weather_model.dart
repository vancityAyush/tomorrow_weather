import 'dart:convert';

import 'package:tomorrow_weather/src/weather/domain/entities/weather.dart';

class OpenWeatherModel extends Weather {
  const OpenWeatherModel({
    required num temp,
    required String main,
    required String description,
    required String name,
  }) : super(
          temp: temp,
          main: main,
          description: description,
          name: name,
        );

  const OpenWeatherModel.empty()
      : this(
          temp: 0.0,
          main: "_empty.main",
          description: "_empty.decription",
          name: "_empty.name",
        );

  factory OpenWeatherModel.fromJson(String str) =>
      OpenWeatherModel.fromMap(json.decode(str));

  factory OpenWeatherModel.fromMap(Map<String, dynamic> json) =>
      OpenWeatherModel(
        temp: json["main"]["temp"],
        main: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "temp": temp,
        "main": main,
        "description": description,
        "name": name,
      };
}
