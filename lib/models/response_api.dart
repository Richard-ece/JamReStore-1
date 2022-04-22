import 'dart:html';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ErrorInputMessage {
  final String id;
  final String? message;

  ErrorInputMessage({required this.id, required this.message});

  factory ErrorInputMessage.fromJson(Map<String, dynamic> json) {
    return ErrorInputMessage(
      id: json['id'],
      message: json['message'],
    );
  }
}

class ResponseApi<T> extends Equatable {
  final bool error;
  final int statusCode;
  final String? message;
  final T? data;
  final List<ErrorInputMessage>? errors;

  ResponseApi({
    required this.statusCode,
    required this.error,
    this.message,
    this.data,
    this.errors,
  });

  get success {
    return !this.error;
  }

  static List<T> listFromJson<T>(
      dynamic json, T Function(Map<String, dynamic> data) mapper) {
    final List<T> items = [];
    json.forEach((x) => items.add(mapper(x)));
    return items;
  }

  factory ResponseApi.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic> data) mapper) {
    return ResponseApi(
      error: json['error'],
      message: json['message'],
      statusCode: HttpStatus.ok,
      data: mapper({"data": json['data']}),
      errors: listFromJson(json['errors'], ErrorInputMessage.fromJson),
    );
  }

  factory ResponseApi.fromError(DioError error) {
    return ResponseApi(
      error: true,
      message: (error.response?.data["message"] != null)
          ? error.response?.data["message"]
          : "Response with status code [${error.response?.statusCode}]",
      statusCode: error.response!.statusCode!,
      errors: listFromJson(
        error.response?.data["errors"],
        ErrorInputMessage.fromJson,
      ),
    );
  }

  @override
  List<Object?> get props => [
        error,
        statusCode,
        message,
        data,
      ];
}
