import 'dart:io';

import 'package:book_stack_design_system/domain/models/error_model.dart';

import 'constants/exception_messages.dart';

class ExceptionHelper {
  static ErrorModel mapExceptionToErrorModel(Exception exception) {
    if (exception is SocketException) {
      return const ErrorModel(
        message: ExceptionMessages.ConnectivityError,
        code: 1002,
      );
    } else {
      return const ErrorModel(
        message: ExceptionMessages.DefaultError,
        code: 9999,
      );
    }
  }
}
