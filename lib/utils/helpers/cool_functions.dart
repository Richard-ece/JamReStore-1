import 'package:jam_re_store/models/response_api.dart';
import 'package:collection/collection.dart';

String? getMessageErrorInput(
  String idInput,
  List<ErrorInputMessage>? errors,
) {
  ErrorInputMessage? errorInput = errors?.firstWhereOrNull(
    (error) => error.id == idInput,
  );
  print(errorInput);
  return errorInput?.message;
}

bool? getErrorInput(
  String idInput,
  List<ErrorInputMessage>? errors,
) {
  ErrorInputMessage? errorInput = errors?.firstWhereOrNull(
    (error) => error.id == idInput,
  );
  print(errorInput);
  return errorInput?.id == null ? null : true;
}
