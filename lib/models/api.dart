import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jam_re_store/models/api_response.dart';

abstract class Api<T> {
  static final Dio dio = Dio();

  final String _backendPath = '';

  Future<ApiResponse<T>> post<T>({
    required String url,
    required T body,
    required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
  }) async {
    return dio
        .post<Map<String, dynamic>>(
      _backendPath,
      data: body,
      options: _getRequestOptions(secured: secured),
    )
        .then(
      (response) {
        return ApiResponse.fromJson(response.data!, mapper);
      },
    ).catchError((error) {
      if (error is DioError) {
        return ApiResponse<T>.fromError(error);
      }
      print("LabbiGoApi :: Unhandled Error :: post($url) :: $error");
      throw error;
    });
  }

  /// Method for making post requests for image upload.
  Future<ApiResponse<T>> postImage<T>({
    @required String url,
    @required File body,
    @required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
    bool chat = false,
  }) async {
    Logger.d(
        "LabbiGoApi :: Start :: postImage($url) :: Excecuting with token ${this.getAuthToken()}");
    Logger.d(
        "LabbiGoApi :: Body :: postImage($url) :: Body => ${body.toString()}");
    String _hostAndProtocol =
        chat ? _getChatHostAndProcotol() : this._getHostAndProcotol();
    String fileName = body.path.split('/').last;
    return dio
        .post<Map<String, dynamic>>(
      _hostAndProtocol + url,
      data: FormData.fromMap({
        "file": await MultipartFile.fromFile(
          body.path,
          filename: fileName,
        ),
      }),
      options: _getRequestImageOptions(secured: secured),
    )
        .then(
      (response) {
        Logger.d("LabbiGoApi :: Success :: post($url) :: Response: $response");
        return ApiResponse<T>.fromJson(response.data, mapper);
      },
    ).catchError((error) {
      if (error is DioError) {
        return ApiResponse<T>.fromError(error);
      } else {
        Logger.e("LabbiGoApi :: Unhandled Error :: put($url) :: ${error}");
        throw error;
      }
    });
  }

  /// Method for making put requests.
  Future<ApiResponse<T>> put<T>({
    @required String url,
    @required Map<String, dynamic> body,
    @required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
    bool chat = false,
  }) async {
    Logger.d(
        "LabbiGoApi :: Start :: put($url) :: Excecuting with token ${this.getAuthToken()}");
    Logger.d("LabbiGoApi :: Body :: put($url) :: Body: ${body.toString()}");
    String _hostAndProtocol =
        chat ? _getChatHostAndProcotol() : this._getHostAndProcotol();

    return dio
        .put<Map<String, dynamic>>(
      _hostAndProtocol + url,
      data: body,
      options: _getRequestOptions(secured: secured),
    )
        .then((response) {
      Logger.d("LabbiGoApi :: Success :: put($url) :: $response");
      return ApiResponse<T>.fromJson(response.data, mapper);
    }, onError: (error) {
      if (error is DioError) {
        Logger.d("LabbiGoApi :: DioError :: put($url) :: ${error}");
        return ApiResponse<T>.fromError(error);
      }
    }).catchError((error) {
      Logger.e("LabbiGoApi :: Unhandled Error :: put($url) :: ${error}");
      throw error;
    });
  }

  /// Method for making get requests.
  Future<ApiResponse<T>> get<T>({
    @required String url,
    @required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
    bool chat = false,
  }) async {
    Logger.d(
        "LabbiGoApi :: Start :: get($url) :: Excecuting with token ${this.getAuthToken()}");
    String _hostAndProtocol =
        chat ? _getChatHostAndProcotol() : this._getHostAndProcotol();

    return dio
        .get<Map<String, dynamic>>(
      _hostAndProtocol + url,
      options: _getRequestOptions(secured: secured),
    )
        .then(
      (response) {
        Logger.d("LabbiGoApi :: Success :: get($url) :: $response");
        // Logger.d("LabbiGoApi :: Success :: get($url) :: NO LOG RESPONSE");
        return ApiResponse<T>.fromJson(response.data, mapper);
      },
    ).catchError((error) {
      if (error is DioError) {
        return ApiResponse<T>.fromError(error);
      } else {
        Logger.e("LabbiGoApi :: Unhandled Error :: get($url) :: ${error}");
        throw error;
      }
    });
  }

  /// Method for making get requests.
  Future<ApiResponse<T>> delete<T>({
    @required String url,
    @required T Function(Map<String, dynamic> data) mapper,
    bool secured = true,
    bool chat = false,
  }) async {
    Logger.d(
        "LabbiGoApi :: delete($url) :: Excecuting with token ${this.getAuthToken()}");
    String _hostAndProtocol =
        chat ? _getChatHostAndProcotol() : this._getHostAndProcotol();

    return dio
        .delete<Map<String, dynamic>>(
      _hostAndProtocol + url,
      options: _getRequestOptions(secured: secured),
    )
        .then(
      (response) {
        Logger.d("LabbiGoApi :: delete($url) :: Success :: $response");
        return ApiResponse<T>.fromJson(response.data, mapper);
      },
    ).catchError((error) {
      if (error is DioError) {
        return ApiResponse<T>.fromError(error);
      } else {
        Logger.e("LabbiGoApi :: delete($url) :: Unhandled Error :: ${error}");
        throw error;
      }
    });
  }

  /// This method obtains the options for the request.
  /// Here are added the security headers.
  Options _getRequestOptions({required bool secured}) {
    // Logger.d("LabbiGoApi :: _getRequestOptions :: Secured: $secured");
    final requestHeaders = {
      if (secured) 'Authorization': 'Bearer ${this.getAuthToken()}'
    };
    if (secured) {
      return Options(
        headers: requestHeaders,
        responseType: ResponseType.json,
      );
    } else {
      return Options(responseType: ResponseType.json);
    }
  }

  /// This method obtains the options for the image request.
  /// Here are added the security headers.
  Options _getRequestImageOptions({required bool secured}) {
    // Logger.d("LabbiGoApi :: _getRequestOptions :: Secured: $secured");
    final requestHeaders = {
      if (secured) 'Authorization': 'Bearer ${this.getAuthToken()}'
    };
    if (secured) {
      return Options(
        headers: requestHeaders,
        contentType: 'multipart/form-data',
      );
    } else {
      return Options(responseType: ResponseType.json);
    }
  }
}
