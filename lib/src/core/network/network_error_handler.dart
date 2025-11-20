import 'dart:io';
import 'package:dio/dio.dart';
import 'package:weather_app/src/core/exceptions/exceptions.dart';

/// Maps Dio errors to clean custom exceptions.
Exception handleNetworkError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return ApplicationException(message: "Request was cancelled.");

    case DioExceptionType.connectionTimeout:
      return ApplicationException(message: "Connection timeout.");

    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return TimeoutException(message: "Server is not responding.");

    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      return NetworkException(message: "No internet connection.");

    case DioExceptionType.badCertificate:
      return ApplicationException(message: "Invalid SSL certificate.");

    case DioExceptionType.badResponse:
      return _parseNetworkErrorResponse(dioError);

    default:
      return ApplicationException(message: "Something went wrong.");
  }
}

/// Parses a server response error.
Exception _parseNetworkErrorResponse(DioException dioError) {
  final statusCode = dioError.response?.statusCode ?? -1;
  final data = dioError.response?.data;

  // Server message
  final message =
  (data is Map<String, dynamic>) ? data["message"]?.toString() : "Error";

  // Server status (fallback to empty string)
  final status =
  (data is Map<String, dynamic>) ? data["status"]?.toString() : "";

  switch (statusCode) {
    case HttpStatus.notFound:
      return NotFoundException(
        status: status.toString(),
        message: message ?? "Not found",
      );

    case HttpStatus.unauthorized:
      return UnauthorizedException(
        status: status.toString(),
        message: message ?? "Unauthorized",
      );

    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException(
        status: status.toString(),
        message: "Service unavailable",
      );

    default:
      return ApiException(
        httpCode: statusCode,
        status: status.toString(),
        message: message ?? "Unexpected error",
      );
  }
}
