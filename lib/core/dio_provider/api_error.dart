import 'dart:io';

import 'package:dio/dio.dart';
import 'package:empowered/constants/app_constant.dart';

class ApiError<T extends Response<dynamic>> implements Exception {
  const ApiError(this.response);
  final T? response;
}

class ApiConnectionRefusedError implements Exception {
  const ApiConnectionRefusedError(this.socketException);
  final SocketException socketException;

  @override
  String toString() {
    final address = socketException.address.toString();
    final port = socketException.port.toString();
    return 'ApiConnectionRefusedError: Connection refused on $address and port $port';
  }

  String toHumanReadableMessage() {
    return 'No internet connection.';
  }
}

abstract class AppError implements Exception {
  const AppError({this.message = AppConstants.errorMessage});
  final String message;
  AppError copyWith({String? message}) =>
      InternalAppError(message: message ?? this.message);
}

class InternalAppError extends AppError {
  const InternalAppError({super.message = AppConstants.errorMessage});
}
