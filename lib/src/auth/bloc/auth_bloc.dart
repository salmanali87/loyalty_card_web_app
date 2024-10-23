import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:loyalty_card_web_app/src/auth/repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState.unknown()) {
    on<CheckLoggedInRequested>(_onSubscriptionRequested);
    on<AuthLogoutPressed>(_onLogoutPressed);
  }

  final AuthRepository _authRepository;
  
  Future<void> _onSubscriptionRequested(
    CheckLoggedInRequested event,
    Emitter<AuthState> emit,
  ) async {
     return emit(const AuthState.unknown());
    // return emit.onEach(
    //   _authRepository.status,
    //   onData: (status) async {
    //     switch (status) {
    //       case AuthStatus.unauthenticated:
    //         return emit(const AuthState.unauthenticated());
    //       case AuthStatus.authenticated:
    //         final user = await _tryGetUser();
    //         return emit(
    //           user != null
    //               ? AuthState.authenticated(user)
    //               : const AuthState.unknown(),
    //         );
    //       case AuthStatus.unknown:
    //         return emit(const AuthState.unknown());
    //     }
    //   },
    //   onError: addError,
    // );
  }

  void _onLogoutPressed(
    AuthLogoutPressed event,
    Emitter<AuthState> emit,
  ) {
    _authRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return user;
    } catch (_) {
      return null;
    }
  }
}
