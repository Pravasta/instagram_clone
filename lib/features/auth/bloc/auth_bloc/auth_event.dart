part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class OnAuthLogin extends AuthEvent {
  final String email;
  final String password;

  OnAuthLogin({required this.email, required this.password});
}

class OnAuthRegister extends AuthEvent {
  final String name;
  final String email;
  final String password;

  OnAuthRegister(
      {required this.name, required this.email, required this.password});
}
