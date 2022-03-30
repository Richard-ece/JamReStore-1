import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class AuthState extends Equatable {
  final RequestStatus signInRequestStatus;
  final RequestStatus signUpRequestStatus;
  final RequestStatus changePasswordRequestStatus;
  final RequestStatus setNumberRequestStatus;
  final DioError? signInRequestError;
  final DioError? signUpRequestError;
  final DioError? changePasswordRequestError;
  final DioError? setNumberRequestError;

  AuthState({
    this.signInRequestStatus = RequestStatus.initial,
    this.signUpRequestStatus = RequestStatus.initial,
    this.changePasswordRequestStatus = RequestStatus.initial,
    this.setNumberRequestStatus = RequestStatus.initial,
    this.signInRequestError,
    this.signUpRequestError,
    this.changePasswordRequestError,
    this.setNumberRequestError,
  });

  AuthState copyWith({
    RequestStatus? signInRequestStatus,
    RequestStatus? signUpRequestStatus,
    RequestStatus? changePasswordRequestStatus,
    RequestStatus? setNumberRequestStatus,
    DioError? signInRequestError,
    DioError? signUpRequestError,
    DioError? changePasswordRequestError,
    DioError? setNumberRequestError,
  }) {
    return AuthState(
      signInRequestStatus: signInRequestStatus ?? this.signInRequestStatus,
      signUpRequestStatus: signUpRequestStatus ?? this.signUpRequestStatus,
      changePasswordRequestStatus:
          changePasswordRequestStatus ?? this.changePasswordRequestStatus,
      setNumberRequestStatus:
          setNumberRequestStatus ?? this.setNumberRequestStatus,
      signInRequestError: signInRequestError ?? this.signInRequestError,
      signUpRequestError: signUpRequestError ?? this.signUpRequestError,
      changePasswordRequestError:
          changePasswordRequestError ?? this.changePasswordRequestError,
      setNumberRequestError:
          setNumberRequestError ?? this.setNumberRequestError,
    );
  }

  @override
  List<Object?> get props => [
        signInRequestStatus,
        signUpRequestStatus,
        changePasswordRequestStatus,
        setNumberRequestStatus,
        signInRequestError,
        signUpRequestError,
        changePasswordRequestError,
        setNumberRequestError,
      ];
}
