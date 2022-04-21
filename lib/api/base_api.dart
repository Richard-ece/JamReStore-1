import 'package:dio/dio.dart';
import 'package:jam_re_store/models/response_api.dart';

abstract class BaseApi<T> {
  static final Dio dio = Dio();

  final String pathApi = "http://localhost:4000/api";

  Future<ResponseApi<T>> post<T>({
    required String url,
    required dynamic body,
    required T Function(Map<String, dynamic> data) mapper,
  }) async {
    return dio
        .post<Map<String, dynamic>>(
      pathApi + url,
      data: body,
    )
        .then(
      (response) {
        return ResponseApi.fromJson(response.data!, mapper);
      },
    ).catchError((error) {
      if (error is DioError) {
        return ResponseApi<T>.fromError(error);
      } else {
        throw error;
      }
    });
  }

  Future<ResponseApi<T>> get<T>({
    required String url,
    required T Function(Map<String, dynamic> data) mapper,
  }) async {
    return dio
        .get<Map<String, dynamic>>(
      pathApi + url,
    )
        .then(
      (response) {
        return ResponseApi.fromJson(response.data!, mapper);
      },
    ).catchError((error) {
      if (error is DioError) {
        return ResponseApi<T>.fromError(error);
      } else {
        throw error;
      }
    });
  }
}
