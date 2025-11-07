import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../../bloc/connectivity/connectivity_cubit.dart';
import '../../bloc/connectivity/connectivity_state.dart';


class ConnectivityInterceptor extends Interceptor {
  final ConnectivityCubit connectivityCubit;

  ConnectivityInterceptor(this.connectivityCubit);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (connectivityCubit.state is ConnectivityOffline) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: 'No Internet Connection',
          type: DioExceptionType.connectionError,
        ),
      );
    } else {
      handler.next(options);
    }
  }
}


Future<bool> isConnected() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

