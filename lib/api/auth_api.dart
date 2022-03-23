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
    print({user.name});
    return Dio().post(
      "${backendPath}/auth/signUp",
      data: {"email": user.email, "password": user.password, "name": user.name},
    ).then((response) {
      return ResponseApi.fromJson(response.data);
    });
  }
}
