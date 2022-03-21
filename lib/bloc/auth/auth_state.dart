import 'package:jam_re_store/pages/auth/form_submission_status.dart';


part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}





const AuthState {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  SignInState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignInState copyWith({
    required String username,
    required String password,
    required FormSubmissionStatus formStatus,
  }) {
    return SignInState(
      username: username,
      password: password,
      formStatus: formStatus,
    );
  }
}
