// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Weather {
  String get address => throw _privateConstructorUsedError;
  num get temperature => throw _privateConstructorUsedError;
  num get main => throw _privateConstructorUsedError;
  num get feelsLike => throw _privateConstructorUsedError;
  num get humidity => throw _privateConstructorUsedError;
  num get windSpeed => throw _privateConstructorUsedError;
  num get windDirection => throw _privateConstructorUsedError;
  num get visibility => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {String address,
      num temperature,
      num main,
      num feelsLike,
      num humidity,
      num windSpeed,
      num windDirection,
      num visibility,
      String iconPath});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? temperature = null,
    Object? main = null,
    Object? feelsLike = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? windDirection = null,
    Object? visibility = null,
    Object? iconPath = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as num,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as num,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as num,
      windDirection: null == windDirection
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as num,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as num,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      num temperature,
      num main,
      num feelsLike,
      num humidity,
      num windSpeed,
      num windDirection,
      num visibility,
      String iconPath});
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? temperature = null,
    Object? main = null,
    Object? feelsLike = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? windDirection = null,
    Object? visibility = null,
    Object? iconPath = null,
  }) {
    return _then(_$WeatherImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as num,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as num,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as num,
      windDirection: null == windDirection
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as num,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as num,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {required this.address,
      required this.temperature,
      required this.main,
      required this.feelsLike,
      required this.humidity,
      required this.windSpeed,
      required this.windDirection,
      required this.visibility,
      required this.iconPath});

  @override
  final String address;
  @override
  final num temperature;
  @override
  final num main;
  @override
  final num feelsLike;
  @override
  final num humidity;
  @override
  final num windSpeed;
  @override
  final num windDirection;
  @override
  final num visibility;
  @override
  final String iconPath;

  @override
  String toString() {
    return 'Weather(address: $address, temperature: $temperature, main: $main, feelsLike: $feelsLike, humidity: $humidity, windSpeed: $windSpeed, windDirection: $windDirection, visibility: $visibility, iconPath: $iconPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.windDirection, windDirection) ||
                other.windDirection == windDirection) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, temperature, main,
      feelsLike, humidity, windSpeed, windDirection, visibility, iconPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final String address,
      required final num temperature,
      required final num main,
      required final num feelsLike,
      required final num humidity,
      required final num windSpeed,
      required final num windDirection,
      required final num visibility,
      required final String iconPath}) = _$WeatherImpl;

  @override
  String get address;
  @override
  num get temperature;
  @override
  num get main;
  @override
  num get feelsLike;
  @override
  num get humidity;
  @override
  num get windSpeed;
  @override
  num get windDirection;
  @override
  num get visibility;
  @override
  String get iconPath;
  @override
  @JsonKey(ignore: true)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
