part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class EmailChanged extends LoginEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class PasswordChanged extends LoginEvent {
  const PasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

final class LogoutSubmitted extends LoginEvent {
  const LogoutSubmitted();
}
