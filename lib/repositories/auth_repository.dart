import 'package:jam_re_store/api/auth_api.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/base_repository.dart';
import 'package:jam_re_store/models/failures.dart';
import 'package:jam_re_store/models/response_api.dart';
import 'package:dartz/dartz.dart';
import 'package:jam_re_store/models/session/profile.dart';

class AuthRepository extends BaseRepository {
  var authApi = AuthApi();

  Future<Either<Failure, Profile>> signIn(UserSignIn userSignIn) async {
    return super.toEither(apiCall: () => authApi.signIn(user: userSignIn));
  }

  Future<ResponseApi> signUp(UserSignUp userSignUp) {
    return authApi.signUp(user: userSignUp).then((response) {
      return response;
    });
  }

  Future<ResponseApi> setNumberPhone(NumberPhone number) {
    return authApi.setNumberPhone(numberPhone: number).then((response) {
      return response;
    });
  }

  Future<ResponseApi> validationCode(Code code) {
    return authApi.validationCode(codeVerificated: code).then((response) {
      return response;
    });
  }
}
