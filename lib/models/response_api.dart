class ResponseApi {
  final bool error;
  final String? message;
  final dynamic? data;

  ResponseApi({required this.error, this.message, this.data});

  factory ResponseApi.fromJson(Map<String, dynamic> json) {
    return ResponseApi(
      error: json['error'],
      message: json['message'],
      data: json['data'],
    );
  }
}
