import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'connectivity_state.dart';


class ConnectivityCubit extends Cubit<ConnectivityState> {
  late final StreamSubscription<ConnectivityResult> _subscription;

  ConnectivityCubit() : super(ConnectivityInitial()) {



    _subscription = Connectivity()
        .onConnectivityChanged
        .map((results) => results.isNotEmpty ? results.first : ConnectivityResult.none)
        .listen((result) {
      if (result == ConnectivityResult.none) {
        emit(ConnectivityOffline());
      } else {
        emit(ConnectivityOnline());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
