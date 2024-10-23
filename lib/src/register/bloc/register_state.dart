part of 'register_bloc.dart';

class RegisterationState extends Equatable {
  final FormzSubmissionStatus status;
  final Name firstName;
  final Name lastName;
  final Name companyName;
  final PhoneNo phoneNo;
  final Email email;
  final Password password;
  final Confirmpassword confirmPassword;
  final bool isValid;

  const RegisterationState({
    this.status = FormzSubmissionStatus.initial,
    this.firstName = const Name.pure(),
    this.lastName = const Name.pure(),
    this.companyName = const Name.pure(),
    this.phoneNo = const PhoneNo.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Confirmpassword.pure(),
    this.isValid = false,
  });

  RegisterationState copyWith({
    FormzSubmissionStatus? status,
    Name? firstName,
    Name? lastName,
    Name? companyName,
    PhoneNo? phoneNo,
    Email? email,
    Password? password,
    Confirmpassword? confirmPassword,
    bool? isValid,
  }) {
    return RegisterationState(
      status: status ?? this.status,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      companyName: companyName ?? this.companyName,
      phoneNo: phoneNo ?? this.phoneNo,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
        status,
        firstName,
        lastName,
        companyName,
        phoneNo,
        email,
        password,
        confirmPassword
      ];
}
