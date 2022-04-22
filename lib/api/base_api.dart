import 'package:dio/dio.dart';
import 'package:jam_re_store/models/preferences.dart';
import 'package:jam_re_store/models/response_api.dart';

abstract class BaseApi<T> {
  static final Dio dio = Dio();

  final String pathApi = "http://localhost:4000/api";
  final Preferences _preferences = Preferences();

  Future<ResponseApi<T>> post<T>({
    required String url,
    required dynamic body,
    required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
  }) async {
    return dio
        .post<Map<String, dynamic>>(
      pathApi + url,
      data: body,
      options: await _getRequestOptions(secured: secured),
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
    bool secured = true,
  }) async {
    return dio
        .get<Map<String, dynamic>>(
      pathApi + url,
      options: await _getRequestOptions(secured: secured),
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

  Future<Options> _getRequestOptions({required bool secured}) async {
    var accessToken = await _preferences.getAccessToken();

    final requestHeaders = {
      if (secured) 'Authorization': 'Bearer ${accessToken}'
    };

    if (secured) {
      return Options(
        headers: requestHeaders,
        responseType: ResponseType.json,
      );
    }

    return Options(responseType: ResponseType.json);
  }
}
