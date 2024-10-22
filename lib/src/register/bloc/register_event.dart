part of 'register_bloc.dart';



sealed class RegisterationEvent {
  const RegisterationEvent();
}


final class RegisterPressed extends RegisterationEvent {}