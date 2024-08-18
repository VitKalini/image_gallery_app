import 'package:dio/dio.dart';

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException() : super(requestOptions: RequestOptions(path: ''));
}

// HTTP Exceptions
// 400
class BadRequestException extends DioException {
  @override
  //ignore: overridden_fields
  final String message;

  BadRequestException({required this.message}) : super(requestOptions: RequestOptions(path: ''));
}

// 401
// a.k.a Unauthorized
class SessionException extends DioException {
  @override
  //ignore: overridden_fields
  final String message;

  SessionException({required this.message}) : super(requestOptions: RequestOptions(path: ''));
}

// 403
class ForbiddenException extends DioException {
  ForbiddenException() : super(requestOptions: RequestOptions(path: ''));
}

// 404
class NotFoundException extends DioException {
  NotFoundException() : super(requestOptions: RequestOptions(path: ''));
}

// 405
class MethodNotAllowedException extends DioException {
  MethodNotAllowedException() : super(requestOptions: RequestOptions(path: ''));
}

// 500
class ServerException extends DioException {
  @override
  //ignore: overridden_fields
  final String message;

  ServerException({required this.message}) : super(requestOptions: RequestOptions(path: ''));
}

// 501
class NotImplementedException extends DioException {
  NotImplementedException() : super(requestOptions: RequestOptions(path: ''));
}

class CacheException extends DioException {
  CacheException() : super(requestOptions: RequestOptions(path: ''));
}
