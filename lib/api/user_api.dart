import 'package:dio/dio.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/response_api.dart';

class UserApi {
  final backendPath = "http://localhost:4000/api";

  Future<ResponseApi> editAccount({required EditAccount user}) {
    return Dio().post(
      "${backendPath}/auth/editProfile",
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
}
