import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode - Error: $message';

  @override
  List<Object?> get props => [message, statusCode];
}

class ApiFailure extends Failure {
  const ApiFailure({
    required String message,
    required int statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  ApiFailure.fromException(
    ApiException exception,
  ) : this(
          message: exception.message,
          statusCode: exception.statusCode,
        );
}
