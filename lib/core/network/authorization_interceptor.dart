import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import '../../main.dart';
import '../constants/app_colors.dart';
import '../constants/keys.dart';
import '../navigation/route_names.dart';
import '../service/app_storage_manager.dart';
import 'package:flutter/material.dart';

import '../widgets/texts/app_text.dart';


class AuthorizationInterceptor extends Interceptor {
  final AppStorageManager storageManager;

  AuthorizationInterceptor({required this.storageManager});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final path = options.path.toLowerCase();

    if (path.endsWith(ApiConfig.signIn) ||
        path.endsWith(ApiConfig.signUp) ||
        path.endsWith(ApiConfig.otp) ||
        path.endsWith(ApiConfig.verifySignIn) ||
        path.endsWith(ApiConfig.resendOtp)
        ) {
      return handler.next(options);
    }

    final token = await storageManager.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;

    if (status == 401) {

      final ctx = navigatorKey.currentContext;
      if (ctx != null) {
        showDialog(
          context: ctx,
          barrierDismissible: false,
          builder: (c) => AlertDialog(
            backgroundColor: AppColors.white,
            title: AppText(text: 'Session Expired'),
            content: AppText(text: 'Please sign in again.'),
            actions: [
              TextButton(
                onPressed: () {
                  storageManager.clearAll();

                  GoRouter.of(ctx).go(RouteNames.login);
                },
                child: AppText(text: 'OK', color: AppColors.primaryColor,),
              ),
            ],
          ),
        );
      }

    }

    handler.next(err);
  }
}






