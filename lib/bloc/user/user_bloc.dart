import 'package:bloc/bloc.dart';
import 'package:jam_re_store/bloc/user/user_event.dart';
import 'package:jam_re_store/bloc/user/user_state.dart';
import 'package:jam_re_store/repositories/user_repository.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  var userRepository = UserRepository();

  UserBloc() : super(UserState()) {
    on<changePasswordRequest>((event, emit) async {
      emit(state.copyWith(
        changePasswordRequestStatus: RequestStatus.loading,
      ));
      await userRepository
          .changePassword(event.changePassword)
          .then((either) async {
        either.fold(
          (failure) {
            emit(state.copyWith(
              changePasswordRequestStatus: RequestStatus.failed,
              changePasswordRequestError: failure,
            ));
          },
          (response) {
            emit(state.copyWith(
              changePasswordRequestStatus: RequestStatus.success,
            ));
          },
        );
      }).catchError((error) {
        emit(state.copyWith(
          changePasswordRequestStatus: RequestStatus.failed,
          changePasswordRequestError: error,
        ));
      });
    });

    on<editProfileRequest>((event, emit) async {
      emit(state.copyWith(
        editProfileRequestStatus: RequestStatus.loading,
      ));
      await userRepository.editAccount(event.editProfile).then((either) async {
        either.fold(
          (failure) {
            emit(state.copyWith(
              editProfileRequestStatus: RequestStatus.failed,
              editProfileRequestError: failure,
            ));
          },
          (response) {
            emit(state.copyWith(
              editProfileRequestStatus: RequestStatus.success,
            ));
          },
        );
      }).catchError((error) {
        emit(state.copyWith(
          editProfileRequestStatus: RequestStatus.failed,
          editProfileRequestError: error,
        ));
      });
    });
  }
}
