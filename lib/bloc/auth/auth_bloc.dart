import 'package:bloc/bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/bloc/auth/auth_state.dart';
import 'package:jam_re_store/repositories/auth_repository.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  var authRepository = AuthRepository();

  AuthBloc() : super(AuthState()) {
    on<SignInRequest>((event, emit) async {
      await authRepository.signIn(event.userSignIn).then((either) {
        either.fold(
          (failure) {
            emit(state.copyWith(
              signInRequestStatus: RequestStatus.failed,
              signInRequestError: failure,
            ));
          },
          (response) {
            emit(state.copyWith(
              signInRequestStatus: RequestStatus.success,
            ));
          },
        );
      }).catchError((error) {
        emit(state.copyWith(
          signInRequestStatus: RequestStatus.failed,
          signInRequestError: error,
        ));
      });
    });
    on<SignUpRequest>((event, emit) async {
      await authRepository.signUp(event.userSignUp).then((either) {
        either.fold(
          (failure) {
            emit(state.copyWith(
              signUpRequestStatus: RequestStatus.failed,
              signUpRequestError: failure,
            ));
          },
          (response) {
            emit(state.copyWith(
              signUpRequestStatus: RequestStatus.success,
            ));
          },
        );
      }).catchError((error) {
        emit(state.copyWith(
          signUpRequestStatus: RequestStatus.failed,
          signUpRequestError: error,
        ));
      });
    });

    on<SetNumberRequest>((event, emit) async {
      await authRepository.setNumberPhone(event.numberPhone).then((either) {
        either.fold(
          (failure) {
            emit(state.copyWith(
              setNumberRequestStatus: RequestStatus.failed,
              setNumberRequestError: failure,
            ));
          },
          (response) {
            emit(state.copyWith(
              setNumberRequestStatus: RequestStatus.success,
            ));
          },
        );
      }).catchError((error) {
        emit(state.copyWith(
          setNumberRequestStatus: RequestStatus.failed,
          setNumberRequestError: error,
        ));
      });
    });

    on<ValidateCodeRequest>((event, emit) async {
      await authRepository.validationCode(event.code).then((either) {
        either.fold(
          (failure) {
            emit(state.copyWith(
              validationCodeRequestStatus: RequestStatus.failed,
              validationCodeRequestError: failure,
            ));
          },
          (response) {
            emit(state.copyWith(
              validationCodeRequestStatus: RequestStatus.success,
            ));
          },
        );
      }).catchError((error) {
        emit(state.copyWith(
          validationCodeRequestStatus: RequestStatus.failed,
          validationCodeRequestError: error,
        ));
      });
    });
  }
}
