import 'package:dartz/dartz.dart';
import 'package:jam_re_store/api/user_api.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/base_repository.dart';
import 'package:jam_re_store/models/failures.dart';
import 'package:jam_re_store/models/session/profile.dart';

class UserRepository extends BaseRepository {
  var userApi = UserApi();

  Future<Either<Failure, Profile>> editAccount(
      EditAccount userEditAccount) async {
    return super
        .toEither(apiCall: () => userApi.editAccount(user: userEditAccount));
  }

  Future<Either<Failure, Profile>> changePassword(Password password) async {
    return super
        .toEither(apiCall: () => userApi.changePassword(password: password));
  }
}
