import 'package:jam_re_store/models/auth/user.dart';

abstract class UserEvent {}

class changePasswordRequest extends UserEvent {
  final Password changePassword;

  changePasswordRequest({required this.changePassword});
}

class editProfileRequest extends UserEvent {
  final EditAccount editProfile;

  editProfileRequest({required this.editProfile});
}
