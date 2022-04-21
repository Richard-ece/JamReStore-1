import 'package:jam_re_store/models/response_api.dart';

class Failure {
  const Failure({
    this.error = true,
    this.statusCode,
    this.message,
    this.errors,
  });

  final bool error;
  final String? message;
  final int? statusCode;
  final List<ErrorInputMessage>? errors;

  factory Failure.fromResponse(ResponseApi response) {
    return Failure(
      message: response.message,
      statusCode: response.statusCode,
      errors: response.errors,
    );
  }
}

class UnauthorizedFailure extends Failure {}

class UnhandledFailure extends Failure {
  Exception exception;

  UnhandledFailure({
    required this.exception,
  });
}
