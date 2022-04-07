import 'package:bloc/bloc.dart';
import 'package:jam_re_store/bloc/user/user_event.dart';
import 'package:jam_re_store/bloc/user/user_state.dart';
import 'package:jam_re_store/repositories/user_repository.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  var userRepository = UserRepository();

  UserBloc() : super(UserState()) {
    on<changePasswordRequest>((event, emit) async {
      await userRepository.changePassword(event.changePassword).then((value) {
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

    on<editProfileRequest>((event, emit) async {
      await userRepository.editAccount(event.editProfile).then((value) {
        emit(state.copyWith(
          editProfileRequestStatus: RequestStatus.succes,
        ));
      }).catchError((error) {
        emit(state.copyWith(
          editProfileRequestStatus: RequestStatus.failed,
          editProfileRequestError: error,
        ));
      });
    });
  }
}
