import 'package:equatable/equatable.dart';
import 'package:jam_re_store/models/failures.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class UserState extends Equatable {
  final RequestStatus changePasswordRequestStatus;
  final RequestStatus editProfileRequestStatus;
  final Failure? changePasswordRequestError;
  final Failure? editProfileRequestError;

  UserState({
    this.changePasswordRequestStatus = RequestStatus.initial,
    this.editProfileRequestStatus = RequestStatus.initial,
    this.changePasswordRequestError,
    this.editProfileRequestError,
  });

  UserState copyWith({
    RequestStatus? changePasswordRequestStatus,
    RequestStatus? editProfileRequestStatus,
    Failure? changePasswordRequestError,
    Failure? editProfileRequestError,
  }) {
    return UserState(
      changePasswordRequestStatus:
          changePasswordRequestStatus ?? this.changePasswordRequestStatus,
      editProfileRequestStatus:
          editProfileRequestStatus ?? this.editProfileRequestStatus,
      changePasswordRequestError:
          changePasswordRequestError ?? this.changePasswordRequestError,
      editProfileRequestError:
          editProfileRequestError ?? this.editProfileRequestError,
    );
  }

  @override
  List<Object?> get props => [
        changePasswordRequestStatus,
        editProfileRequestStatus,
        changePasswordRequestError,
        editProfileRequestError,
      ];
}
