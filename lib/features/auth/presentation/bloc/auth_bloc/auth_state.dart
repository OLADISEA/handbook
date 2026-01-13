import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loading, authenticated, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final bool isPasswordVisible;
  final String? uid;
  final String? errorMessage;



  const AuthState({
    this.status = AuthStatus.initial,
    this.isPasswordVisible = false,
    this.uid,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    bool? isPasswordVisible,
    String? uid,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      uid: uid ?? this.uid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, isPasswordVisible, uid, errorMessage];
}