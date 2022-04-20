import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ResponseApi<T> extends Equatable {
  final bool error;
  final int statusCode;
  final String? message;
  final T? data;

  ResponseApi({
    required this.statusCode,
    required this.error,
    this.message,
    this.data,
  });

  get success {
    return !this.error;
  }

  factory ResponseApi.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic> data) mapper) {
    return ResponseApi(
      error: json['error'],
      message: json['message'],
      statusCode: json['statusCode'],
      data: mapper({"data": json['data']}),
    );
  }

  factory ResponseApi.fromError(DioError error) {
    return ResponseApi(
      error: true,
      message: (error.response?.data["message"] != null)
          ? error.response?.data["message"]
          : "Response with status code [${error.response?.statusCode}]",
      statusCode: error.response!.statusCode!,
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
