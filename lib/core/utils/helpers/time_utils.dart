import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String time) => DateTime.parse(time);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}

extension AppDateTime on DateTime {
  String formatDateTime() {
    return DateFormat('EEEE, dd MMM').format(this);
  }

  String formatTimeToHour() {
    return DateFormat('h a').format(this).toUpperCase();
  }

  String formatDayOfWeek() {
    return DateFormat('E').format(this).toUpperCase();
  }
}
