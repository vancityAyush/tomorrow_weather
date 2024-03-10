// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DailyWeather {
  DateTime get time => throw _privateConstructorUsedError;
  num get temperatureAvg => throw _privateConstructorUsedError;
  num get temperatureMin => throw _privateConstructorUsedError;
  num get temperatureMax => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailyWeatherCopyWith<DailyWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyWeatherCopyWith<$Res> {
  factory $DailyWeatherCopyWith(
          DailyWeather value, $Res Function(DailyWeather) then) =
      _$DailyWeatherCopyWithImpl<$Res, DailyWeather>;
  @useResult
  $Res call(
      {DateTime time,
      num temperatureAvg,
      num temperatureMin,
      num temperatureMax,
      String icon});
}

/// @nodoc
class _$DailyWeatherCopyWithImpl<$Res, $Val extends DailyWeather>
    implements $DailyWeatherCopyWith<$Res> {
  _$DailyWeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperatureAvg = null,
    Object? temperatureMin = null,
    Object? temperatureMax = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperatureAvg: null == temperatureAvg
          ? _value.temperatureAvg
          : temperatureAvg // ignore: cast_nullable_to_non_nullable
              as num,
      temperatureMin: null == temperatureMin
          ? _value.temperatureMin
          : temperatureMin // ignore: cast_nullable_to_non_nullable
              as num,
      temperatureMax: null == temperatureMax
          ? _value.temperatureMax
          : temperatureMax // ignore: cast_nullable_to_non_nullable
              as num,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyWeatherImplCopyWith<$Res>
    implements $DailyWeatherCopyWith<$Res> {
  factory _$$DailyWeatherImplCopyWith(
          _$DailyWeatherImpl value, $Res Function(_$DailyWeatherImpl) then) =
      __$$DailyWeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime time,
      num temperatureAvg,
      num temperatureMin,
      num temperatureMax,
      String icon});
}

/// @nodoc
class __$$DailyWeatherImplCopyWithImpl<$Res>
    extends _$DailyWeatherCopyWithImpl<$Res, _$DailyWeatherImpl>
    implements _$$DailyWeatherImplCopyWith<$Res> {
  __$$DailyWeatherImplCopyWithImpl(
      _$DailyWeatherImpl _value, $Res Function(_$DailyWeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperatureAvg = null,
    Object? temperatureMin = null,
    Object? temperatureMax = null,
    Object? icon = null,
  }) {
    return _then(_$DailyWeatherImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperatureAvg: null == temperatureAvg
          ? _value.temperatureAvg
          : temperatureAvg // ignore: cast_nullable_to_non_nullable
              as num,
      temperatureMin: null == temperatureMin
          ? _value.temperatureMin
          : temperatureMin // ignore: cast_nullable_to_non_nullable
              as num,
      temperatureMax: null == temperatureMax
          ? _value.temperatureMax
          : temperatureMax // ignore: cast_nullable_to_non_nullable
              as num,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DailyWeatherImpl implements _DailyWeather {
  const _$DailyWeatherImpl(
      {required this.time,
      required this.temperatureAvg,
      required this.temperatureMin,
      required this.temperatureMax,
      required this.icon});

  @override
  final DateTime time;
  @override
  final num temperatureAvg;
  @override
  final num temperatureMin;
  @override
  final num temperatureMax;
  @override
  final String icon;

  @override
  String toString() {
    return 'DailyWeather(time: $time, temperatureAvg: $temperatureAvg, temperatureMin: $temperatureMin, temperatureMax: $temperatureMax, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyWeatherImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperatureAvg, temperatureAvg) ||
                other.temperatureAvg == temperatureAvg) &&
            (identical(other.temperatureMin, temperatureMin) ||
                other.temperatureMin == temperatureMin) &&
            (identical(other.temperatureMax, temperatureMax) ||
                other.temperatureMax == temperatureMax) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, time, temperatureAvg, temperatureMin, temperatureMax, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyWeatherImplCopyWith<_$DailyWeatherImpl> get copyWith =>
      __$$DailyWeatherImplCopyWithImpl<_$DailyWeatherImpl>(this, _$identity);
}

abstract class _DailyWeather implements DailyWeather {
  const factory _DailyWeather(
      {required final DateTime time,
      required final num temperatureAvg,
      required final num temperatureMin,
      required final num temperatureMax,
      required final String icon}) = _$DailyWeatherImpl;

  @override
  DateTime get time;
  @override
  num get temperatureAvg;
  @override
  num get temperatureMin;
  @override
  num get temperatureMax;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$DailyWeatherImplCopyWith<_$DailyWeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
