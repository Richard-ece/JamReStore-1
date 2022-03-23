import 'package:jam_re_store/models/auth/user.dart';

abstract class AuthEvent {}

class SignInRequest extends AuthEvent {
  final UserSignIn userSignIn;

  SignInRequest({required this.userSignIn});
}

class SignUpRequest extends AuthEvent {
  final UserSignUp userSignUp;

  SignUpRequest({required this.userSignUp});
}

class changePasswordRequest extends AuthEvent {
  final Password changePassword;

  changePasswordRequest({required this.changePassword});
}