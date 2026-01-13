import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/auth_repo.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibility);
    on<RegisterRequested>(_onRegisterRequested);
    on<LoginRequested>(_onLoginRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibilityEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onRegisterRequested(
      RegisterRequested event, Emitter<AuthState> emit) async {
    // We emit 'loading' while PRESERVING isPasswordVisible
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      final result = await authRepository.signUp(
        email: event.email,
        password: event.password,
        name: event.name,
        level: event.level,
      );
      emit(state.copyWith(
          status: AuthStatus.authenticated,
          uid: result.user!.uid
      ));
    } catch (e) {
      emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: e.toString()
      ));
    }
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final result = await authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(status: AuthStatus.authenticated, uid: result.user!.uid));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> _onForgotPasswordRequested(
      ForgotPasswordRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await authRepository.resetPassword(email: event.email);
      // Use a specific status or just return to initial with a success message
      emit(state.copyWith(status: AuthStatus.initial));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: e.toString()));
    }
  }
}