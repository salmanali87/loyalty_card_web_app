part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class CheckLoggedInRequested extends AuthEvent {}

final class AuthLogoutPressed extends AuthEvent {}
