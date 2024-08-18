import 'package:image_gallery_app/core/error/exceptions.dart';
import 'package:image_gallery_app/core/error/failures.dart';

class FailureMapper {
  static Failure mapExceptionToFailure(Exception exception) {
    if (exception is BadRequestException) {
      return BadRequestFailure(message: exception.message);
    } else if (exception is SessionException) {
      return SessionFailure(message: exception.message);
    } else if (exception is ForbiddenException) {
      return const ForbiddenFailure();
    } else if (exception is NotFoundException) {
      return const NotFoundFailure();
    } else if (exception is MethodNotAllowedException) {
      return const MethodNotAllowedFailure();
    } else if (exception is ServerException) {
      return ServerFailure(message: exception.message);
    } else if (exception is NotImplementedException) {
      return const NotImplementedFailure();
    } else if (exception is CacheException) {
      return const CacheFailure();
    } else if (exception is NoInternetConnectionException) {
      return const NoInternetConnectionFailure();
    } else {
      return const ServerFailure(message: 'Unknown error occurred');
    }
  }

  static String mapFailureToMessage(Failure failure) {
    if (failure is BadRequestFailure) {
      return failure.message ?? 'Invalid request.';
    } else if (failure is SessionFailure) {
      return failure.message ?? 'Session has expired. Please log in again.';
    } else if (failure is ForbiddenFailure) {
      return 'You do not have permission to access this resource.';
    } else if (failure is NotFoundFailure) {
      return 'The requested resource was not found.';
    } else if (failure is MethodNotAllowedFailure) {
      return 'This method is not allowed.';
    } else if (failure is ServerFailure) {
      return failure.message ?? 'A server error occurred. Please try again later.';
    } else if (failure is NotImplementedFailure) {
      return 'This feature is not implemented.';
    } else if (failure is CacheFailure) {
      return 'Failed to retrieve data from cache.';
    } else if (failure is NoInternetConnectionFailure) {
      return 'No internet connection. Please check your network settings.';
    } else {
      return 'An unknown error occurred.';
    }
  }
}
