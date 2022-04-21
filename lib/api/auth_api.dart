import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/api/base_api.dart';
import 'package:jam_re_store/models/response_api.dart';
import 'package:jam_re_store/models/session/profile.dart';

class AuthApi extends BaseApi {
  Future<ResponseApi<Profile>> signIn({required UserSignIn user}) async {
    return super.post(
      url: "/auth/signIn",
      body: {"email": user.email, "password": user.password},
      mapper: (data) {
        print("maper");
        return Profile.fromJson(data['data']);
      },
    );
  }

  Future<ResponseApi<Profile>> signUp({required UserSignUp user}) async {
    return super.post(
      url: "/auth/signUp",
      body: {"email": user.email, "name": user.name},
      mapper: (data) => Profile.fromJson(data['data']),
    );
  }

  Future<ResponseApi<Profile>> setNumberPhone(
      {required NumberPhone numberPhone}) async {
    return super.post(
      url: "/auth/OtpNumber",
      body: {
        "numberPhone": numberPhone.number,
        "countryCode": numberPhone.country
      },
      mapper: (data) => Profile.fromJson(data['data']),
    );
  }

  Future<ResponseApi<void>> validationCode(
      {required Code codeVerificated}) async {
    return super.post(
      url: "/auth/otp",
      body: {"otpCodePhone": codeVerificated.code},
      mapper: (data) => data,
    );
  }
}
