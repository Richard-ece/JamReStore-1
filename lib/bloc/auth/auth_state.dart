import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class AuthState extends Equatable {
  final String name;
  final String password;
  final String email;
  final RequestStatus signInRequestStatus;
  final RequestStatus signUpRequestStatus;
  final DioError? signInRequestError;
  final DioError? signUpRequestError;

  AuthState({
    this.name = '',
    this.password = '',
    this.email = '',
    this.signInRequestStatus = RequestStatus.initial,
    this.signUpRequestStatus = RequestStatus.initial,
    this.signInRequestError,
    this.signUpRequestError,
  });

  AuthState copyWith({
    String? name,
    String? password,
    String? email,
    RequestStatus? signInRequestStatus,
    RequestStatus? signUpRequestStatus,
    DioError? signInRequestError,
    DioError? signUpRequestError,
  }) {
    return AuthState(
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      signInRequestStatus: signInRequestStatus ?? this.signInRequestStatus,
      signUpRequestStatus: signUpRequestStatus ?? this.signUpRequestStatus,
      signInRequestError: signInRequestError ?? this.signInRequestError,
      signUpRequestError: signUpRequestError ?? this.signUpRequestError,
    );
  }

  @override
  List<Object?> get props => [
        name,
        password,
        email,
        signInRequestStatus,
        signUpRequestStatus,
        signInRequestError,
        signUpRequestError,
      ];
}
