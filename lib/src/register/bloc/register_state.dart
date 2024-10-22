part of 'register_bloc.dart';



class RegisterationState extends Equatable {

  const RegisterationState._({ this.status = RegistrationStatus.unknown, });

  const RegisterationState.unknown() : this._();

  const RegisterationState.registered(User user) : this._(status: RegistrationStatus.registered);

  const RegisterationState.unregistered() : this._(status: RegistrationStatus.unregistered);

  final RegistrationStatus status;

  @override
  List<Object> get props => [status];
  
}