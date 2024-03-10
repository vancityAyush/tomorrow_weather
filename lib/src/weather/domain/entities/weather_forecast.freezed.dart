// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherForecast {
  List<WeatherForecastModel> get hourly => throw _privateConstructorUsedError;
  List<DailyWeather> get daily => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherForecastCopyWith<WeatherForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastCopyWith<$Res> {
  factory $WeatherForecastCopyWith(
          WeatherForecast value, $Res Function(WeatherForecast) then) =
      _$WeatherForecastCopyWithImpl<$Res, WeatherForecast>;
  @useResult
  $Res call({List<WeatherForecastModel> hourly, List<DailyWeather> daily});
}

/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res, $Val extends WeatherForecast>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourly = null,
    Object? daily = null,
  }) {
    return _then(_value.copyWith(
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<WeatherForecastModel>,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as List<DailyWeather>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherForecastImplCopyWith<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  factory _$$WeatherForecastImplCopyWith(_$WeatherForecastImpl value,
          $Res Function(_$WeatherForecastImpl) then) =
      __$$WeatherForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WeatherForecastModel> hourly, List<DailyWeather> daily});
}

/// @nodoc
class __$$WeatherForecastImplCopyWithImpl<$Res>
    extends _$WeatherForecastCopyWithImpl<$Res, _$WeatherForecastImpl>
    implements _$$WeatherForecastImplCopyWith<$Res> {
  __$$WeatherForecastImplCopyWithImpl(
      _$WeatherForecastImpl _value, $Res Function(_$WeatherForecastImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourly = null,
    Object? daily = null,
  }) {
    return _then(_$WeatherForecastImpl(
      hourly: null == hourly
          ? _value._hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<WeatherForecastModel>,
      daily: null == daily
          ? _value._daily
          : daily // ignore: cast_nullable_to_non_nullable
              as List<DailyWeather>,
    ));
  }
}

/// @nodoc

class _$WeatherForecastImpl implements _WeatherForecast {
  const _$WeatherForecastImpl(
      {required final List<WeatherForecastModel> hourly,
      required final List<DailyWeather> daily})
      : _hourly = hourly,
        _daily = daily;

  final List<WeatherForecastModel> _hourly;
  @override
  List<WeatherForecastModel> get hourly {
    if (_hourly is EqualUnmodifiableListView) return _hourly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourly);
  }

  final List<DailyWeather> _daily;
  @override
  List<DailyWeather> get daily {
    if (_daily is EqualUnmodifiableListView) return _daily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daily);
  }

  @override
  String toString() {
    return 'WeatherForecast(hourly: $hourly, daily: $daily)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastImpl &&
            const DeepCollectionEquality().equals(other._hourly, _hourly) &&
            const DeepCollectionEquality().equals(other._daily, _daily));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hourly),
      const DeepCollectionEquality().hash(_daily));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      __$$WeatherForecastImplCopyWithImpl<_$WeatherForecastImpl>(
          this, _$identity);
}

abstract class _WeatherForecast implements WeatherForecast {
  const factory _WeatherForecast(
      {required final List<WeatherForecastModel> hourly,
      required final List<DailyWeather> daily}) = _$WeatherForecastImpl;

  @override
  List<WeatherForecastModel> get hourly;
  @override
  List<DailyWeather> get daily;
  @override
  @JsonKey(ignore: true)
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WeatherForecastModel {
  DateTime get date => throw _privateConstructorUsedError;
  num get temperature => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherForecastModelCopyWith<WeatherForecastModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastModelCopyWith<$Res> {
  factory $WeatherForecastModelCopyWith(WeatherForecastModel value,
          $Res Function(WeatherForecastModel) then) =
      _$WeatherForecastModelCopyWithImpl<$Res, WeatherForecastModel>;
  @useResult
  $Res call({DateTime date, num temperature, String icon});
}

/// @nodoc
class _$WeatherForecastModelCopyWithImpl<$Res,
        $Val extends WeatherForecastModel>
    implements $WeatherForecastModelCopyWith<$Res> {
  _$WeatherForecastModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? temperature = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as num,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherForecastModelImplCopyWith<$Res>
    implements $WeatherForecastModelCopyWith<$Res> {
  factory _$$WeatherForecastModelImplCopyWith(_$WeatherForecastModelImpl value,
          $Res Function(_$WeatherForecastModelImpl) then) =
      __$$WeatherForecastModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, num temperature, String icon});
}

/// @nodoc
class __$$WeatherForecastModelImplCopyWithImpl<$Res>
    extends _$WeatherForecastModelCopyWithImpl<$Res, _$WeatherForecastModelImpl>
    implements _$$WeatherForecastModelImplCopyWith<$Res> {
  __$$WeatherForecastModelImplCopyWithImpl(_$WeatherForecastModelImpl _value,
      $Res Function(_$WeatherForecastModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? temperature = null,
    Object? icon = null,
  }) {
    return _then(_$WeatherForecastModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as num,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WeatherForecastModelImpl implements _WeatherForecastModel {
  const _$WeatherForecastModelImpl(
      {required this.date, required this.temperature, required this.icon});

  @override
  final DateTime date;
  @override
  final num temperature;
  @override
  final String icon;

  @override
  String toString() {
    return 'WeatherForecastModel(date: $date, temperature: $temperature, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, temperature, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastModelImplCopyWith<_$WeatherForecastModelImpl>
      get copyWith =>
          __$$WeatherForecastModelImplCopyWithImpl<_$WeatherForecastModelImpl>(
              this, _$identity);
}

abstract class _WeatherForecastModel implements WeatherForecastModel {
  const factory _WeatherForecastModel(
      {required final DateTime date,
      required final num temperature,
      required final String icon}) = _$WeatherForecastModelImpl;

  @override
  DateTime get date;
  @override
  num get temperature;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$WeatherForecastModelImplCopyWith<_$WeatherForecastModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
