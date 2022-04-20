import 'package:dio/dio.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/base_api.dart';
import 'package:jam_re_store/models/response_api.dart';
import 'package:jam_re_store/models/session/profile.dart';

class AuthApi extends BaseApi {
  Future<ResponseApi<Profile>> signIn({required UserSignIn user}) async {
    return super.post(
      url: "/auth/signIn",
      body: {"email": user.email, "password": user.password},
      mapper: (data) => Profile.fromJson(data['data']),
    );
  }

  Future<ResponseApi> signUp({required UserSignUp user}) {
    return Dio().post(
      "${backendPath}/auth/signUp",
      data: {"email": user.email, "password": user.password, "name": user.name},
    ).then((response) {
      return ResponseApi.fromJson(response.data);
    });
  }

  Future<ResponseApi> setNumberPhone({required NumberPhone numberPhone}) {
    return Dio().post(
      "${backendPath}/auth/OtpNumber",
      data: {
        "numberPhone": numberPhone.number,
        "countryCode": numberPhone.country
      },
    ).then((response) {
      return ResponseApi.fromJson(response.data);
    });
  }

  Future<ResponseApi> validationCode({required Code codeVerificated}) {
    return Dio().post(
      "${backendPath}/auth/otp",
      data: {"otpCodePhone": codeVerificated.code},
    ).then((response) {
      return ResponseApi.fromJson(response.data);
    });
  }
}
