import 'package:jam_re_store/models/response_api.dart';

class Failure {
  const Failure({
    this.statusCode,
    this.message,
  });

  final String? message;
  final int? statusCode;

  factory Failure.fromResponse(ResponseApi response) {
    
    return Failure(
        message: response.message,
        statusCode: response.statusCode,
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
