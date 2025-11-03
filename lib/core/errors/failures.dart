import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable {
  final String message;
  final int statusCode;
  const AppError({required this.message, required this.statusCode});

  @override
  List<Object> get props => [message, statusCode];
}

class ApiError extends AppError {
  const ApiError({required super.message, super.statusCode = 500});
}

class StorageError extends AppError {
  const StorageError({required super.message, super.statusCode = 500});
}



abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}
