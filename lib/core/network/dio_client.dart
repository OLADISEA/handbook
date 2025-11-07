import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../bloc/connectivity/connectivity_cubit.dart';
import '../constants/keys.dart';
import '../service/app_storage_manager.dart';
import '../utils/connectivity_interceptor.dart';
import '../utils/exceptions.dart';
import '../utils/network_exceptions.dart';
import 'authorization_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final Dio dio;
  final ConnectivityCubit connectivityCubit;
  final AppStorageManager storageManager;
  late final String baseUrl;

  ApiClient(
      {required this.dio,
      required this.connectivityCubit,
      required this.storageManager,
      String? customUrl}) {
    baseUrl = customUrl == null || customUrl.isEmpty
        ? '${ApiConfig.baseUrl}/'
        : customUrl;

    // Configure Dio
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    dio.interceptors.add(ConnectivityInterceptor(connectivityCubit));
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      error: true,
    ));
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        // responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 120,
      ),
    );
    dio.interceptors
        .add(AuthorizationInterceptor(storageManager: storageManager));
  }

  set header(Map<String, dynamic> header) {
    dio.options.headers = header;
  }

  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(path, queryParameters: params);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    } on FormatException {
      throw const FormatException('Bad response format ');
    }
  }

  Future<Response> post(String path,
      {dynamic data, Map<String, dynamic>? params}) async {
    try {
      final response =
          await dio.post(path, data: data, queryParameters: params);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    } on FormatException {
      throw const FormatException('Bad response format ');
    }
  }

  Future<Response> put(String path,
      {dynamic data, Map<String, dynamic>? params}) async {
    try {
      final response = await dio.put(path, data: data, queryParameters: params);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    } on FormatException {
      throw const FormatException('Bad response format ');
    }
  }

  Future<Response> patch(String path,
      {dynamic data, Map<String, dynamic>? params}) async {
    try {
      final response =
          await dio.patch(path, data: data, queryParameters: params);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    } on FormatException {
      throw const FormatException('Bad response format');
    }
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    try {
      final options = data != null
          ? Options(contentType: Headers.formUrlEncodedContentType)
          : null;
      final response = await dio.delete(path,
          queryParameters: params, data: data, options: options);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    } on FormatException {
      throw const FormatException('Bad response format');
    }
  }

  Future<Response> download(String url, String savePath,
      {Map<String, dynamic>? params}) async {
    try {
      final response =
          await dio.download(url, savePath, queryParameters: params);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    } on FormatException {
      throw const FormatException('Bad response format');
    }
  }


  Future<Response> upload2Image(
    String path, {
    required File file1,
    required File file2,
    Map<String, dynamic>? params,
  }) async {
    final fileName1 = file1.path.split('/').last;
    final fileName2 = file2.path.split('/').last;
    try {
      final formData = FormData.fromMap({
        'files': [
          await MultipartFile.fromFile(file1.path, filename: fileName1),
          await MultipartFile.fromFile(file2.path, filename: fileName2),
        ]
      });
      final response =
          await dio.post(path, data: formData, queryParameters: params);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    } on FormatException {
      throw const FormatException('Bad response format');
    }
  }

  Future<Response> uploadImage(
    String path, {
    required File file,
    required String fieldName,
    Map<String, dynamic>? params,
  }) async {
    final fileName = file.path.split('/').last;
    try {
      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(file.path, filename: fileName),
      });
      final response =
          await dio.post(path, data: formData, queryParameters: params);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    } on FormatException {
      throw const FormatException('Bad response format');
    }
  }

  Future<Response> multipartUpload(
    String path, {
    required FormData formData,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response =
          await dio.post(path, data: formData, queryParameters: params);
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    } on FormatException {
      throw const FormatException('Bad response format');
    }
  }

  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return TimeoutException("Connection timed out");
      case DioExceptionType.sendTimeout:
        return TimeoutException("Send timeout");
      case DioExceptionType.receiveTimeout:
        return TimeoutException("Receive timeout");
      case DioExceptionType.badResponse:
        final data = error.response?.data;
        final errorMessage =
            data is Map<String, dynamic> && data['message'] != null
                ? data['message'].toString()
                : "Server error: ${error.response?.statusCode}";
        return BadResponseException(errorMessage);
      case DioExceptionType.cancel:
        return Exception("Request cancelled");
      case DioExceptionType.connectionError:
        return NetworkException("No internet connection");
      default:
        return ServerException(error.message ?? "Unknown error");
    }
  }
}
