import 'package:jam_re_store/api/auth_api.dart';
import 'package:jam_re_store/models/auth/access_token.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/repositories/base_repository.dart';
import 'package:jam_re_store/models/failures.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends BaseRepository {
  var authApi = AuthApi();

  Future<Either<Failure, AccessToken>> signIn(UserSignIn userSignIn) async {
    return super.toEither(apiCall: () => authApi.signIn(user: userSignIn));
  }

  Future<Either<Failure, AccessToken>> signUp(UserSignUp userSignUp) async {
    return super.toEither(apiCall: () => authApi.signUp(user: userSignUp));
  }

  Future<Either<Failure, void>> setNumberPhone(NumberPhone number) async {
    return super
        .toEither(apiCall: () => authApi.setNumberPhone(numberPhone: number));
  }

  Future<Either<Failure, void>> validationCode(Code code) async {
    return super
        .toEither(apiCall: () => authApi.validationCode(codeVerificated: code));
  }

  Future<Either<Failure, void>> createPassword(String password) async {
    return super
        .toEither(apiCall: () => authApi.createPassword(password: password));
  }
}
