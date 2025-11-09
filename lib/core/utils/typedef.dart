import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

typedef ResultFuture<T> = Future<Either<AppError, T>>;

typedef ValidateResult = Future<CheckResponse>;

typedef ResultVoid = Future<Either<AppError, void>>;

typedef FutureBool = Future<bool>;

typedef DataMap = Map<String, String>;

typedef DataMapJson = Map<String, dynamic>;

typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUrl);



class CheckResponse {
  bool status;
  String message;
  CheckResponse({required this.status, required this.message});
}
