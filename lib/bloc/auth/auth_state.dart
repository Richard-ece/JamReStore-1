import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class AuthState extends Equatable {
  final RequestStatus signInRequestStatus;
  final RequestStatus signUpRequestStatus;
  final RequestStatus changePasswordRequestStatus;
  final DioError? signInRequestError;
  final DioError? signUpRequestError;
  final DioError? changePasswordRequestError;

  AuthState({
    this.signInRequestStatus = RequestStatus.initial,
    this.signUpRequestStatus = RequestStatus.initial,
    this.changePasswordRequestStatus = RequestStatus.initial,
    this.signInRequestError,
    this.signUpRequestError,
    this.changePasswordRequestError,
  });

  AuthState copyWith({
    RequestStatus? signInRequestStatus,
    RequestStatus? signUpRequestStatus,
    RequestStatus? changePasswordRequestStatus,
    DioError? signInRequestError,
    DioError? signUpRequestError,
    DioError? changePasswordRequestError,
  }) {
    return AuthState(
      signInRequestStatus: signInRequestStatus ?? this.signInRequestStatus,
      signUpRequestStatus: signUpRequestStatus ?? this.signUpRequestStatus,
      changePasswordRequestStatus: changePasswordRequestStatus ?? this.changePasswordRequestStatus,
      signInRequestError: signInRequestError ?? this.signInRequestError,
      signUpRequestError: signUpRequestError ?? this.signUpRequestError,
      changePasswordRequestError: changePasswordRequestError ?? this.changePasswordRequestError,
    );
  }

  @override
  List<Object?> get props => [
        signInRequestStatus,
        signUpRequestStatus,
        changePasswordRequestStatus,
        signInRequestError,
        signUpRequestError,
        changePasswordRequestError,
      ];
}
