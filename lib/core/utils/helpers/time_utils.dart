import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String time) => DateTime.parse(time);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
