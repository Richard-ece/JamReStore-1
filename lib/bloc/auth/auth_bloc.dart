import 'package:bloc/bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/bloc/auth/auth_state.dart';
import 'package:jam_re_store/models/preferences.dart';
import 'package:jam_re_store/repositories/auth_repository.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  var authRepository = AuthRepository();
  var preferences = Preferences();

  AuthBloc() : super(AuthState()) {
    on<SignInRequest>((event, emit) async {
      emit(state.copyWith(
        signInRequestStatus: RequestStatus.loading,
      ));
      await authRepository.signIn(event.userSignIn).then((either) async {
        await either.fold(
          (failure) async {
            emit(state.copyWith(
              signInRequestStatus: RequestStatus.failed,
              signInRequestError: failure,
            ));
          },
          (response) async {
            await preferences.setAccessToken(response.accessToken);
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
      emit(state.copyWith(
        signUpRequestStatus: RequestStatus.loading,
      ));
      await authRepository.signUp(event.userSignUp).then((either) async {
        await either.fold(
          (failure) {
            emit(state.copyWith(
              signUpRequestStatus: RequestStatus.failed,
              signUpRequestError: failure,
            ));
          },
          (response) async {
            await preferences.setAccessToken(response.accessToken);
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
      emit(state.copyWith(
        setNumberRequestStatus: RequestStatus.loading,
      ));
      await authRepository
          .setNumberPhone(event.numberPhone)
          .then((either) async {
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

    on<SendCodeRequest>((event, emit) async {
      emit(state.copyWith(
        sendCodeRequestStatus: RequestStatus.loading,
      ));
      await authRepository.sendCode().then((either) async {
        either.fold(
          (failure) {
            emit(state.copyWith(
              sendCodeRequestStatus: RequestStatus.failed,
              sendCodeRequestError: failure,
            ));
          },
          (response) {
            emit(state.copyWith(
              sendCodeRequestStatus: RequestStatus.success,
            ));
          },
        );
      }).catchError((error) {
        emit(state.copyWith(
          sendCodeRequestStatus: RequestStatus.failed,
          sendCodeRequestError: error,
        ));
      });
    });

    on<ValidateCodeRequest>((event, emit) async {
      emit(state.copyWith(
        validateCodeRequestStatus: RequestStatus.loading,
      ));
      await authRepository.validateCode(event.code).then((either) async {
        either.fold(
          (failure) {
            emit(state.copyWith(
              validateCodeRequestStatus: RequestStatus.failed,
              validateCodeRequestError: failure,
            ));
          },
          (response) {
            emit(state.copyWith(
              validateCodeRequestStatus: RequestStatus.success,
            ));
          },
        );
      }).catchError((error) {
        emit(state.copyWith(
          validateCodeRequestStatus: RequestStatus.failed,
          validateCodeRequestError: error,
        ));
      });
    });

    on<CreatePasswordRequest>((event, emit) async {
      emit(state.copyWith(
        createPasswordRequestStatus: RequestStatus.loading,
      ));
      await authRepository.createPassword(event.password).then((either) async {
        either.fold(
          (failure) {
            print(failure.errors?.first.id);
            print("failure");
            emit(state.copyWith(
              createPasswordRequestStatus: RequestStatus.failed,
              createPasswordRequestError: failure,
            ));
          },
          (response) {
            emit(state.copyWith(
              createPasswordRequestStatus: RequestStatus.success,
            ));
          },
        );
      }).catchError((error) {
        emit(state.copyWith(
          createPasswordRequestStatus: RequestStatus.failed,
          createPasswordRequestError: error,
        ));
      });
    });
  }
}
