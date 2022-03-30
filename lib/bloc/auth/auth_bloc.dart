import 'package:bloc/bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/bloc/auth/auth_state.dart';
import 'package:jam_re_store/repositories/auth_repository.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  var authRepository = AuthRepository();

  AuthBloc() : super(AuthState()) {
    on<SignInRequest>((event, emit) async {
      await authRepository.signIn(event.userSignIn).then((value) {
        emit(state.copyWith(
          signInRequestStatus: RequestStatus.succes,
        ));
      }).catchError((error) {
        emit(state.copyWith(
          signInRequestStatus: RequestStatus.failed,
          signInRequestError: error,
        ));
      });
    });
    on<SignUpRequest>((event, emit) async {
      await authRepository.signUp(event.userSignUp).then((value) {
        emit(state.copyWith(
          signUpRequestStatus: RequestStatus.succes,
        ));
      }).catchError((error) {
        emit(state.copyWith(
          signUpRequestStatus: RequestStatus.failed,
          signUpRequestError: error,
        ));
      });
    });

    on<SetNumberRequest>((event, emit) async {
      await authRepository.setNumber(event.setNumber).then((value) {
        emit(state.copyWith(
          setNumberRequestStatus: RequestStatus.succes,
        ));
      }).catchError((error) {
        emit(state.copyWith(
          setNumberRequestStatus: RequestStatus.failed,
          setNumberRequestError: error,
        ));
      });
    });

    on<changePasswordRequest>((event, emit) async {
      await authRepository.changePassword(event.changePassword).then((value) {
        emit(state.copyWith(
          changePasswordRequestStatus: RequestStatus.succes,
        ));
      }).catchError((error) {
        emit(state.copyWith(
          changePasswordRequestStatus: RequestStatus.failed,
          changePasswordRequestError: error,
        ));
      });
    });
  }
}
