import 'package:jam_re_store/api/user_api.dart';
import 'package:jam_re_store/models/auth/user.dart';
import 'package:jam_re_store/models/response_api.dart';

class UserRepository {
  var userApi = UserApi();

  Future<ResponseApi> editAccount(EditAccount userEditAccount) {
    return userApi.editAccount(user: userEditAccount).then((response) {
      return response;
    });
  }

  Future<ResponseApi> changePassword(Password password) {
    return userApi.changePassword(password: password).then((response) {
      return response;
    });
  }
}
