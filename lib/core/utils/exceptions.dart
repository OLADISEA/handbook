class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => message;
}


class TimeoutException implements Exception {
  final String message;
  TimeoutException([this.message = "Request timed out"]);

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = "No network connection"]);

  @override
  String toString() => message;
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException([this.message = "Bad request"]);
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = "Unauthorized"]);

  @override
  String toString() => message;
}
