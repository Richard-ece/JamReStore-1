import 'package:bloc/bloc.dart';
import 'package:jam_re_store/bloc/auth/auth_event.dart';
import 'package:jam_re_store/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<SignInRequest>((event, emit) {
      // TODO: implement event handler
    });
    on<SignUpRequest>((event, emit) {
      // TODO: implement event handler
    });
  }
}
