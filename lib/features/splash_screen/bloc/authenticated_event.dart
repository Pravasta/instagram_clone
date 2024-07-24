part of 'authenticated_bloc.dart';

@immutable
sealed class AuthenticatedEvent {}

class UnAuthenticated extends AuthenticatedEvent {}

class Authenticated extends AuthenticatedEvent {}
