import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class AuthState extends Equatable {
  final RequestStatus signInRequestStatus;
  final RequestStatus signUpRequestStatus;
  final RequestStatus changePasswordRequestStatus;
  final RequestStatus setNumberRequestStatus;
  final RequestStatus validationCodeRequestStatus;
  final DioError? signInRequestError;
  final DioError? signUpRequestError;
  final DioError? changePasswordRequestError;
  final DioError? setNumberRequestError;
  final DioError? validationCodeRequestError;

  AuthState({
    this.signInRequestStatus = RequestStatus.initial,
    this.signUpRequestStatus = RequestStatus.initial,
    this.changePasswordRequestStatus = RequestStatus.initial,
    this.setNumberRequestStatus = RequestStatus.initial,
    this.validationCodeRequestStatus = RequestStatus.initial,
    this.signInRequestError,
    this.signUpRequestError,
    this.changePasswordRequestError,
    this.setNumberRequestError,
    this.validationCodeRequestError,
  });

  AuthState copyWith({
    RequestStatus? signInRequestStatus,
    RequestStatus? signUpRequestStatus,
    RequestStatus? changePasswordRequestStatus,
    RequestStatus? setNumberRequestStatus,
    RequestStatus? validationCodeRequestStatus,
    DioError? signInRequestError,
    DioError? signUpRequestError,
    DioError? changePasswordRequestError,
    DioError? setNumberRequestError,
    DioError? validationCodeRequestError,
  }) {
    return AuthState(
      signInRequestStatus: signInRequestStatus ?? this.signInRequestStatus,
      signUpRequestStatus: signUpRequestStatus ?? this.signUpRequestStatus,
      changePasswordRequestStatus:
          changePasswordRequestStatus ?? this.changePasswordRequestStatus,
      setNumberRequestStatus:
          setNumberRequestStatus ?? this.setNumberRequestStatus,
      validationCodeRequestStatus:
          validationCodeRequestStatus ?? this.setNumberRequestStatus,
      signInRequestError: signInRequestError ?? this.signInRequestError,
      signUpRequestError: signUpRequestError ?? this.signUpRequestError,
      changePasswordRequestError:
          changePasswordRequestError ?? this.changePasswordRequestError,
      setNumberRequestError:
          setNumberRequestError ?? this.setNumberRequestError,
      validationCodeRequestError:
          validationCodeRequestError ?? this.setNumberRequestError,
    );
  }

  @override
  List<Object?> get props => [
        signInRequestStatus,
        signUpRequestStatus,
        changePasswordRequestStatus,
        setNumberRequestStatus,
        validationCodeRequestStatus,
        signInRequestError,
        signUpRequestError,
        changePasswordRequestError,
        setNumberRequestError,
        validationCodeRequestError,
      ];
}
