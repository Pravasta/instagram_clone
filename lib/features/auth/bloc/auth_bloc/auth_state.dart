part of 'auth_bloc.dart';

class AuthState {
  final String message;
  final LoginResult? result;
  final AuthStatusState status;

  AuthState({
    this.message = '',
    this.result,
    this.status = AuthStatusState.initial,
  });

  AuthState copyWith({
    String? message,
    LoginResult? result,
    AuthStatusState? status,
  }) {
    return AuthState(
      message: message ?? this.message,
      result: result ?? this.result,
      status: status ?? this.status,
    );
  }
}
