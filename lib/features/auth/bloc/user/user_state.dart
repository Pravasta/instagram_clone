part of 'user_bloc.dart';

class UserState {
  final String message;
  final LoginResult? user;
  final UserStatusState status;

  UserState({
    this.message = '',
    this.user,
    this.status = UserStatusState.initial,
  });

  UserState copyWith({
    String? message,
    LoginResult? user,
    UserStatusState? status,
  }) {
    return UserState(
      message: message ?? this.message,
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
