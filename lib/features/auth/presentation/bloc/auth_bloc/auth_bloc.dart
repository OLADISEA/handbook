import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<TogglePasswordVisibilityEvent>(_onTogglePasswordVisibility);
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibilityEvent event, Emitter<AuthState> emit) {
    // Toggle the password visibility and emit a new state
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}
