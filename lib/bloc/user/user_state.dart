import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:jam_re_store/utils/constants/enums.dart';

class UserState extends Equatable {
  final RequestStatus changePasswordRequestStatus;
  final RequestStatus editProfileRequestStatus;
  final DioError? changePasswordRequestError;
  final DioError? editProfileRequestError;

  UserState({
    this.changePasswordRequestStatus = RequestStatus.initial,
    this.editProfileRequestStatus = RequestStatus.initial,
    this.changePasswordRequestError,
    this.editProfileRequestError,
  });

  UserState copyWith({
    RequestStatus? changePasswordRequestStatus,
    RequestStatus? editProfileRequestStatus,
    DioError? changePasswordRequestError,
    DioError? editProfileRequestError,
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
