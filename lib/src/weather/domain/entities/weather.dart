import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final num temp;
  final String main;
  final String description;
  final String name;

  const Weather({
    required this.temp,
    required this.main,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [temp, name, main, description];

  const Weather.empty()
      : this(
          temp: 0.0,
          main: "_empty.main",
          name: "_empty.name",
          description: "_empty.decription",
        );
}
