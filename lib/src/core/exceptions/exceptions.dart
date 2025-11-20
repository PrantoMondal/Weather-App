import 'dart:io';

abstract class BaseException implements Exception {
  final String message;

  BaseException({required this.message});
}

class LocationPermissionDeniedException extends BaseException {
  LocationPermissionDeniedException({required super.message});
}

class LocationPermissionDeniedForeverException extends BaseException {
  LocationPermissionDeniedForeverException({required super.message});
}

class ApiException extends BaseException {
  final int httpCode;
  final String status;

  ApiException({required this.httpCode, required this.status, required super.message});
}

class ApplicationException extends BaseException {
  ApplicationException({required super.message});
}

class JsonFormatException extends BaseException {
  JsonFormatException({required super.message});
}

class NetworkException extends BaseException {
  NetworkException({required super.message});
}

class NotFoundException extends ApiException {
  NotFoundException({required super.status, required super.message})
    : super(httpCode: HttpStatus.notFound);
}

class ServiceUnavailableException extends ApiException {
  ServiceUnavailableException({required super.status, required super.message})
    : super(httpCode: HttpStatus.serviceUnavailable);
}

class TimeoutException extends BaseException {
  TimeoutException({required super.message});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({required super.status, required super.message})
    : super(httpCode: HttpStatus.unauthorized);
}
