abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class CacheFailure extends Failure {
  CacheFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class NetWorkFailure extends Failure {
  NetWorkFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class HiveFailure extends Failure {
  HiveFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
