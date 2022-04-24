import 'package:equatable/equatable.dart';
import 'package:jam_re_store/models/failures.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class AuthState extends Equatable {
  final RequestStatus signInRequestStatus;
  final RequestStatus signUpRequestStatus;
  final RequestStatus setNumberRequestStatus;
  final RequestStatus sendCodeRequestStatus;
  final RequestStatus validateCodeRequestStatus;
  final RequestStatus createPasswordRequestStatus;
  final Failure? signInRequestError;
  final Failure? signUpRequestError;
  final Failure? setNumberRequestError;
  final Failure? sendCodeRequestError;
  final Failure? validateCodeRequestError;
  final Failure? createPasswordRequestError;

  AuthState({
    this.signInRequestStatus = RequestStatus.initial,
    this.signUpRequestStatus = RequestStatus.initial,
    this.setNumberRequestStatus = RequestStatus.initial,
    this.sendCodeRequestStatus = RequestStatus.initial,
    this.validateCodeRequestStatus = RequestStatus.initial,
    this.createPasswordRequestStatus = RequestStatus.initial,
    this.signInRequestError,
    this.signUpRequestError,
    this.setNumberRequestError,
    this.sendCodeRequestError,
    this.validateCodeRequestError,
    this.createPasswordRequestError,
  });

  AuthState copyWith({
    RequestStatus? signInRequestStatus,
    RequestStatus? signUpRequestStatus,
    RequestStatus? setNumberRequestStatus,
    RequestStatus? sendCodeRequestStatus,
    RequestStatus? validateCodeRequestStatus,
    RequestStatus? createPasswordRequestStatus,
    Failure? signInRequestError,
    Failure? signUpRequestError,
    Failure? setNumberRequestError,
    Failure? sendCodeRequestError,
    Failure? validateCodeRequestError,
    Failure? createPasswordRequestError,
  }) {
    return AuthState(
      signInRequestStatus: signInRequestStatus ?? this.signInRequestStatus,
      signUpRequestStatus: signUpRequestStatus ?? this.signUpRequestStatus,
      setNumberRequestStatus:
          setNumberRequestStatus ?? this.setNumberRequestStatus,
      sendCodeRequestStatus:
          sendCodeRequestStatus ?? this.sendCodeRequestStatus,
      createPasswordRequestStatus:
          createPasswordRequestStatus ?? this.createPasswordRequestStatus,
      validateCodeRequestStatus:
          validateCodeRequestStatus ?? this.validateCodeRequestStatus,
      signInRequestError: signInRequestError ?? this.signInRequestError,
      signUpRequestError: signUpRequestError ?? this.signUpRequestError,
      setNumberRequestError:
          setNumberRequestError ?? this.setNumberRequestError,
      sendCodeRequestError: sendCodeRequestError ?? this.sendCodeRequestError,
      validateCodeRequestError:
          validateCodeRequestError ?? this.validateCodeRequestError,
      createPasswordRequestError:
          createPasswordRequestError ?? this.createPasswordRequestError,
    );
  }

  @override
  List<Object?> get props => [
        signInRequestStatus,
        signUpRequestStatus,
        setNumberRequestStatus,
        sendCodeRequestStatus,
        validateCodeRequestStatus,
        createPasswordRequestStatus,
        signInRequestError,
        signUpRequestError,
        setNumberRequestError,
        sendCodeRequestError,
        validateCodeRequestError,
        createPasswordRequestError,
      ];
}
