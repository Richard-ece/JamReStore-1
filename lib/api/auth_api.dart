import 'package:dio/dio.dart';
import 'package:jam_re_store/models/auth/user.dart';

class AuthApi {
  final backendPath = "http://localhost:4000/api";

  Future<dynamic> signIn({required UserSignIn user}) {
    return Dio().post(
      "${backendPath}/auth/signIn",
      data: {"email": user.email, "password": user.password},
    );
  }

  Future<dynamic> signUp({required UserSignUp user}) {
    return Dio().post(
      "${backendPath}/auth/signUp",
      data: {"email": user.email, "password": user.password, "name": user.name},
    );
  }
}
