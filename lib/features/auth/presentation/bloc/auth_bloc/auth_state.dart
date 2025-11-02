import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isPasswordVisible;

  const AuthState({this.isPasswordVisible = false});

  AuthState copyWith({bool? isPasswordVisible}) {
    return AuthState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible];
}
