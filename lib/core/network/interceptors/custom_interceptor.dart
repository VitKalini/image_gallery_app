import 'dart:async';

import 'package:dio/dio.dart';
import 'package:image_gallery_app/core/error/exceptions.dart';
import '../network_info.dart';

class CustomInterceptor extends Interceptor {
  final NetworkInfo? networkInfo;
  CustomInterceptor(
    this.networkInfo,
  );
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response == null) {
      Timer(const Duration(milliseconds: 100), () async {
        if (!(await networkInfo?.isConnected ?? false)) {
          throw NoInternetConnectionException();
        }
      });
    }
    final customException = _handleError(err.response);
    return handler.reject(DioException(
      requestOptions: err.requestOptions,
      error: customException,
    ));
  }

  Exception _handleError(Response? response) {
    switch (response?.statusCode) {
      case 400:
        return BadRequestException(message: 'Invalid request');
      case 401:
        return SessionException(message: 'Unauthorized');
      case 403:
        return ForbiddenException();
      case 404:
        return NotFoundException();
      case 405:
        return MethodNotAllowedException();
      case 500:
        return ServerException(message: 'Internal server error');
      case 501:
        return NotImplementedException();
      default:
        return ServerException(message: 'Unknown error');
    }
  }
}
