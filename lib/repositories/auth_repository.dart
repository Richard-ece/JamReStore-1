import 'package:jam_re_store/api/auth_api.dart';
import 'package:jam_re_store/models/auth/user.dart';

class AuthRepository {
  var authApi = AuthApi();

  Future<dynamic> signIn(UserSignIn userSignIn) async {
    return  authApi.signIn(user: userSignIn);
  }

  Future<dynamic> signUp(UserSignUp userSignUp) async {
    return  authApi.signUp(user: userSignUp);
  }
}
