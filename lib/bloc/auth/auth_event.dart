part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginUsernameChanged extends AuthEvent {
  final String username;

  LoginUsernameChanged({required this.username});
}

class LoginPasswordChanged extends AuthEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends AuthEvent {}
