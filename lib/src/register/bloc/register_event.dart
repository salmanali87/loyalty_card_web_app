part of 'register_bloc.dart';

sealed class RegisterationEvent extends Equatable {
  const RegisterationEvent();

  @override
  List<Object> get props => [];
}

final class FirstNameChanged extends RegisterationEvent {
  const FirstNameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

final class LastNameChanged extends RegisterationEvent {
  const LastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}


final class CompanyNameChanged extends RegisterationEvent {
  const CompanyNameChanged(this.companyName);

  final String companyName;

  @override
  List<Object> get props => [companyName];
}


final class PhoneNoChanged extends RegisterationEvent {
  const PhoneNoChanged(this.phoneNo);

  final String phoneNo;

  @override
  List<Object> get props => [phoneNo];
}



final class EmailChanged extends RegisterationEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}


final class PasswordChanged extends RegisterationEvent {
  const PasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}


final class ConfirmPasswordChanged extends RegisterationEvent {
  const ConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}





final class RegisterPressed extends RegisterationEvent {
  const RegisterPressed();
}
