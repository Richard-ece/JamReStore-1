import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/base_api.dart';
import 'package:jam_re_store/models/response_api.dart';
import 'package:jam_re_store/models/session/profile.dart';

class UserApi extends BaseApi {
  Future<ResponseApi<Profile>> editAccount({required EditAccount user}) async {
    return super.post(
      url: "/auth/editProfile",
      body: {"email": user.email, "password": user.password, "name": user.name},
      mapper: (data) => Profile.fromJson(data['data']),
    );
  }

  Future<ResponseApi<Profile>> changePassword(
      {required Password password}) async {
    return super.post(
      url: "/auth/password",
      body: {"email": password.email, "password": password.password},
      mapper: (data) => Profile.fromJson(data['data']),
    );
  }
}
