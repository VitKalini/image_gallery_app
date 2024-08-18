import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  List<Object?> get props => [message];
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure({super.message});
}

// 400
class BadRequestFailure extends Failure {
  const BadRequestFailure({super.message});
}

// 401
class SessionFailure extends Failure {
  const SessionFailure({super.message});
}

// 403
class ForbiddenFailure extends Failure {
  const ForbiddenFailure() : super();
}

// 404
class NotFoundFailure extends Failure {
  const NotFoundFailure() : super();
}

// 405
class MethodNotAllowedFailure extends Failure {
  const MethodNotAllowedFailure() : super();
}

// 500
class ServerFailure extends Failure {
  const ServerFailure({super.message});
}

// 501
class NotImplementedFailure extends Failure {
  const NotImplementedFailure() : super();
}

class CacheFailure extends Failure {
  const CacheFailure() : super();
}
