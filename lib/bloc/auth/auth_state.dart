import 'package:equatable/equatable.dart';
import 'package:jam_re_store/models/failures.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class AuthState extends Equatable {
  final RequestStatus signInRequestStatus;
  final RequestStatus signUpRequestStatus;
  final RequestStatus setNumberRequestStatus;
  final RequestStatus validationCodeRequestStatus;
  final RequestStatus createPasswordRequestStatus;
  final Failure? signInRequestError;
  final Failure? signUpRequestError;
  final Failure? setNumberRequestError;
  final Failure? validationCodeRequestError;
  final Failure? createPasswordRequestError;

  AuthState({
    this.signInRequestStatus = RequestStatus.initial,
    this.signUpRequestStatus = RequestStatus.initial,
    this.setNumberRequestStatus = RequestStatus.initial,
    this.validationCodeRequestStatus = RequestStatus.initial,
    this.createPasswordRequestStatus = RequestStatus.initial,
    this.signInRequestError,
    this.signUpRequestError,
    this.setNumberRequestError,
    this.validationCodeRequestError,
    this.createPasswordRequestError,
  });

  AuthState copyWith({
    RequestStatus? signInRequestStatus,
    RequestStatus? signUpRequestStatus,
    RequestStatus? setNumberRequestStatus,
    RequestStatus? validationCodeRequestStatus,
    RequestStatus? createPasswordRequestStatus,
    Failure? signInRequestError,
    Failure? signUpRequestError,
    Failure? setNumberRequestError,
    Failure? validationCodeRequestError,
    Failure? createPasswordRequestError,
  }) {
    return AuthState(
      signInRequestStatus: signInRequestStatus ?? this.signInRequestStatus,
      signUpRequestStatus: signUpRequestStatus ?? this.signUpRequestStatus,
      setNumberRequestStatus:
          setNumberRequestStatus ?? this.setNumberRequestStatus,
      validationCodeRequestStatus:
          validationCodeRequestStatus ?? this.setNumberRequestStatus,
      signInRequestError: signInRequestError ?? this.signInRequestError,
      signUpRequestError: signUpRequestError ?? this.signUpRequestError,
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
        setNumberRequestStatus,
        validationCodeRequestStatus,
        signInRequestError,
        signUpRequestError,
        setNumberRequestError,
        validationCodeRequestError,
      ];
}
