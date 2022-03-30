import 'package:dio/dio.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/response_api.dart';

class AuthApi {
  final backendPath = "http://localhost:4000/api";

  Future<ResponseApi> signIn({required UserSignIn user}) {
    return Dio().post(
      "${backendPath}/auth/signIn",
      data: {"email": user.email, "password": user.password},
    ).then((response) {
      return ResponseApi.fromJson(response.data);
    });
  }

  Future<ResponseApi> signUp({required UserSignUp user}) {
    return Dio().post(
      "${backendPath}/auth/signUp",
      data: {"email": user.email, "password": user.password, "name": user.name},
    ).then((response) {
      return ResponseApi.fromJson(response.data);
    });
  }

  Future<ResponseApi> changePassword({required Password password}) {
    return Dio().post(
      "${backendPath}/auth/password",
      data: {"email": password.email, "password": password.password},
    ).then((response) {
      return ResponseApi.fromJson(response.data);
    });
  }

  Future<ResponseApi> setNumber({required Number number}) {
    return Dio().post(
      "${backendPath}/auth/signUp",
      data: {"Number": number.number, "password": number.password},
    ).then((response) {
      return ResponseApi.fromJson(response.data);
    });
  }
}
