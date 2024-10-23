import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:loyalty_card_web_app/src/auth/repo/auth_repo.dart';
import 'package:loyalty_card_web_app/src/register/models/models.dart';
import 'package:loyalty_card_web_app/src/register/repo/register_repo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterationEvent, RegisterationState> {
  RegisterBloc(
      {required RegistrationRepository registerRepository,
      required AuthRepository authRepository})
      : _registerRepository = registerRepository,
        _authRepository = authRepository,
        super(const RegisterationState()) {
    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChangedd);
    on<CompanyNameChanged>(_onCompanyNameChanged);
    on<PhoneNoChanged>(_onPhoneChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterPressed>(_onRegistered);
  }

  final RegistrationRepository _registerRepository;
  final AuthRepository _authRepository;
  User? _user;

  void _onFirstNameChanged(
    FirstNameChanged event,
    Emitter<RegisterationState> emit,
  ) {
    final firstName = Name.dirty(event.firstName);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([
          firstName,
          state.lastName,
          state.companyName,
          state.phoneNo,
          state.email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void _onLastNameChangedd(
    LastNameChanged event,
    Emitter<RegisterationState> emit,
  ) {
    final lastName = Name.dirty(event.lastName);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate([
          state.firstName,
          lastName,
          state.companyName,
          state.phoneNo,
          state.email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void _onCompanyNameChanged(
    CompanyNameChanged event,
    Emitter<RegisterationState> emit,
  ) {
    final companyName = Name.dirty(event.companyName);
    emit(
      state.copyWith(
        companyName: companyName,
        isValid: Formz.validate([
          state.firstName,
          state.lastName,
          companyName,
          state.phoneNo,
          state.email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void _onPhoneChanged(
    PhoneNoChanged event,
    Emitter<RegisterationState> emit,
  ) {
    final phoneNo = PhoneNo.dirty(event.phoneNo);
    emit(
      state.copyWith(
        phoneNo: phoneNo,
        isValid: Formz.validate([
          state.firstName,
          state.lastName,
          state.companyName,
          phoneNo,
          state.email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<RegisterationState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.firstName,
          state.lastName,
          state.companyName,
          state.phoneNo,
          email,
          state.password,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<RegisterationState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([
          password,
          state.firstName,
          state.lastName,
          state.companyName,
          state.phoneNo,
          state.email,
          state.confirmPassword,
        ]),
      ),
    );
  }

  void _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<RegisterationState> emit,
  ) {
    final confirmPassword = Confirmpassword.dirty(event.confirmPassword);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate([
          state.firstName,
          state.lastName,
          state.companyName,
          state.phoneNo,
          state.email,
          state.password,
          confirmPassword,
        ]),
      ),
    );
  }

  Future<void> _onRegistered(
    RegisterPressed event,
    Emitter<RegisterationState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _registerRepository.register(
          email: state.email.value,
          password: state.password.value,
        );
        _authRepository.loggedIn();
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = FirebaseAuth.instance.currentUser,
    );
  }
}
