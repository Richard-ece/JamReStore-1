import 'package:jam_re_store/api/auth_api.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/response_api.dart';

class AuthRepository {
  var authApi = AuthApi();

  Future<ResponseApi> signIn(UserSignIn userSignIn) {
    return authApi.signIn(user: userSignIn).then((response) {
      return response;
    });
  }

  Future<ResponseApi> signUp(UserSignUp userSignUp) {
    return authApi.signUp(user: userSignUp).then((response) {
      return response;
    });
  }
}
