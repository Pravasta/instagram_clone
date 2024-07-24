part of 'authenticated_bloc.dart';

class AuthenticatedState {
  final AuthenticatedStatusState status;
  final String message;
  final bool? isAuthenticated;

  AuthenticatedState({
    this.status = AuthenticatedStatusState.initial,
    this.message = '',
    this.isAuthenticated = false,
  });

  AuthenticatedState copyWith({
    AuthenticatedStatusState? status,
    String? message,
    bool? isAuthenticated,
  }) {
    return AuthenticatedState(
      status: status ?? this.status,
      message: message ?? this.message,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
