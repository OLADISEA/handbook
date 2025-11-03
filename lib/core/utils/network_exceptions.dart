class NetworkTimeoutException implements Exception {
  final String message;
  NetworkTimeoutException(this.message);
}

class BadResponseException implements Exception {
  final String message;
  BadResponseException(this.message);

  @override
  String toString() => message;
}

class InvalidRefreshTokenException implements Exception {
  final String message;
  InvalidRefreshTokenException([this.message = "Session expired"]);
}

