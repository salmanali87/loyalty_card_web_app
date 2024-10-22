import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loyalty_card_web_app/src/register/repo/register_repo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterationEvent, RegisterationState> {
  RegisterBloc({required RegistrationRepository registerRepository})
      : _registerRepository = registerRepository,
        super(const RegisterationState.unknown()) {
    on<RegisterPressed>(_onRegistered);
  }

  final RegistrationRepository _registerRepository;
  User? _user;

  Future<void> _onRegistered(
    RegisterPressed event,
    Emitter<RegisterationState> emit,
  ) {
    return emit.onEach(
      _registerRepository.status,
      onData: (status) async {
        switch (status) {
          case RegistrationStatus.unregistered:
            return emit(const RegisterationState.unregistered());
          case RegistrationStatus.registered:
          final user = await getUser();
            return emit(
              user != null
                  ? RegisterationState.registered(user)
                  : const RegisterationState.unregistered(),
            );
          case RegistrationStatus.unknown:
            return emit(const RegisterationState.unknown());
        }
      },
      onError: addError,
    );
  }

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = FirebaseAuth.instance.currentUser,
    );
  }
}
