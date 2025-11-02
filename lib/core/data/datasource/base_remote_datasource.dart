import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/exceptions.dart';

mixin BaseRemoteDataSource {
  Future<FormData> buildMultipartFormData({
    required Map<String, XFile?> files,
    Map<String, dynamic>? fields = const {},
  }) async {
    final Map<String, dynamic> formMap = {};

    formMap.addAll(fields!);

    for (var entry in files.entries) {
      final file = entry.value;
      if (file != null) {
        final multipartFile = await MultipartFile.fromFile(
          file.path,
          filename: file.name,
        );
        formMap[entry.key] = multipartFile;
      }
    }

    return FormData.fromMap(formMap);
  }


  void ensure2xxOrThrow(Response r) {
    final code = r.statusCode;
    if (code == 200 || code == 201) return;
    final msg = r.data['message']?.toString() ?? 'HTTP $code';
    switch (code) {
      case 400:
        throw BadRequestException(msg);
      case 401:
        throw UnauthorizedException(msg);
      case 403:
        throw ServerException('Forbidden: $msg');
      default:
        throw ServerException(msg);
    }
  }

  Exception mapDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return TimeoutException();
    }
    if (e.error is SocketException) {
      return NetworkException();
    }
    return ServerException(e.message ?? 'Unknown error');
  }
}
