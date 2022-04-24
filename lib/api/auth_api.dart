import 'package:jam_re_store/models/auth/access_token.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/api/base_api.dart';
import 'package:jam_re_store/models/response_api.dart';

class AuthApi extends BaseApi {
  Future<ResponseApi<AccessToken>> signIn({required UserSignIn user}) async {
    return super.post(
      url: "/auth/signIn",
      body: {"email": user.email, "password": user.password},
      secured: false,
      mapper: (data) => AccessToken.fromJson(data['data']),
    );
  }

  Future<ResponseApi<AccessToken>> signUp({required UserSignUp user}) async {
    return super.post(
      url: "/auth/signUp",
      body: {"email": user.email, "name": user.name},
      secured: false,
      mapper: (data) => AccessToken.fromJson(data['data']),
    );
  }

  Future<ResponseApi<void>> setNumberPhone(
      {required NumberPhone numberPhone}) async {
    return super.post(
      url: "/auth/OtpNumber",
      body: {
        "numberPhone": numberPhone.number,
        "countryCode": numberPhone.country
      },
      mapper: (data) => data,
    );
  }

  Future<ResponseApi<void>> sendCode() async {
    return super.get(
      url: "/auth/sendCode",
      mapper: (data) => data,
    );
  }

  Future<ResponseApi<void>> validateCode(
      {required Code codeVerificated}) async {
    return super.post(
      url: "/auth/validateCode",
      body: {"otpCode": codeVerificated.code},
      mapper: (data) => data,
    );
  }

  Future<ResponseApi<void>> createPassword({required String password}) async {
    return super.post(
      url: "/auth/createPassword",
      body: {"password": password},
      mapper: (data) => data,
    );
  }
}
