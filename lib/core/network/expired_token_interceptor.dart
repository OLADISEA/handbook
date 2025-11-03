import 'package:dio/dio.dart';

import '../../injection_container.dart';
import '../service/app_storage_manager.dart';


class TokenInterceptor extends Interceptor {

  TokenInterceptor();

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 400 || response.data['error'] == 'invalid refresh token') {
      await _handleTokenExpiration();
    }
    return super.onResponse(response, handler);
  }

  Future<void> _handleTokenExpiration() async {
    final storage = sl<AppStorageManager>();
    await storage.clearAll();

  }
}
