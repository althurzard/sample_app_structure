import 'package:dio/dio.dart';

enum AppErrorType { SERVER_ERROR, TIME_OUT, TOKEN_ERROR }

enum ErrorCode { BAD_REQUEST, UNAUTHORIZED, NOT_FOUND, FORBIDDEN }

class ErrorCodeHelper {
  static ErrorCode create(int value) {
    ErrorCode errorCode;
    switch (value) {
      case 400:
        errorCode = ErrorCode.BAD_REQUEST;
        break;
      case 401:
        errorCode = ErrorCode.UNAUTHORIZED;
        break;
      case 403:
        errorCode = ErrorCode.FORBIDDEN;
        break;
      case 404:
        errorCode = ErrorCode.FORBIDDEN;
        break;
      default:
        errorCode = ErrorCode.BAD_REQUEST;
        break;
    }
    return errorCode;
  }

  static int value(ErrorCode value) {
    switch (value) {
      case ErrorCode.BAD_REQUEST:
        return 400;
      case ErrorCode.UNAUTHORIZED:
        return 401;
      case ErrorCode.NOT_FOUND:
        return 403;
      case ErrorCode.FORBIDDEN:
        return 404;
    }
    return 400;
  }
}

class AppError implements Exception {
  String message = '';
  AppErrorType type = AppErrorType.SERVER_ERROR;
  ErrorCode errorCode = ErrorCode.BAD_REQUEST;
  AppError({this.message, this.type, this.errorCode});

  factory AppError.fromJson(Map<String, dynamic> json) {
    var message = '';
    try {
      message = json['message'] ?? json['error']['message'];
    } catch (e) {
      message = message?.isEmpty ?? true ? 'Unknown error' : message;
    }
    return AppError(message: message);
  }

  static AppError withDioError(DioError e) {
    var type = AppErrorType.SERVER_ERROR;
    switch (e.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        type = AppErrorType.TIME_OUT;
        break;
      default:
        break;
    }
    var error = e.response != null
        ? (e.response.data is String
            ? AppError(
                message: e.response.data,
                type: type,
                errorCode: ErrorCodeHelper.create(e.response?.statusCode))
            : AppError.fromJson(e.response.data))
        : AppError(
            message: e.message ?? '',
            type: type,
            errorCode: ErrorCodeHelper.create(e.response?.statusCode));
    return error;
  }
}
