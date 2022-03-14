import 'dart:html';

import 'package:dio/dio.dart';

class ApiResponse<T> {
  final String? url;
  final T? data;
  final bool? error;
  final String? message;
  final int? statusCode;
  final Exception? exception;

  const ApiResponse({
    this.url,
    this.data,
    this.error,
    this.message,
    this.statusCode,
    this.exception,
  });

  get success {
    bool _error = this.error ?? false;
    return !_error;
  }

  factory ApiResponse.fromError(DioError error) {
    return ApiResponse(
      url:
          "${error.requestOptions.path}/${error.requestOptions.queryParameters}",
      error: true,
      message: "Response with status code [${error.response?.statusCode}]",
      statusCode: error.response?.statusCode,
      exception: error,
    );
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json,
          T Function(Map<String, dynamic> data) mapper) =>
      ApiResponse(
        error: json['error'],
        message: json['message'],
        data: mapper({"data": json['data']}),
        statusCode: HttpStatus.ok,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'error': error,
        'data': data,
        'message': message,
        'statusCode': statusCode,
        'exception': exception.toString(),
      };
}
