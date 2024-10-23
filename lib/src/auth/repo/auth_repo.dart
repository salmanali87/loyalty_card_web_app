import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _controller = StreamController<AuthStatus>();
  User? _user;

  AuthRepository() {
    print("object created");
  }

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
        _controller.add(AuthStatus.authenticated);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void loggedIn() {
    print("login register");
    _controller.add(AuthStatus.authenticated);
    print("login register added");
  }

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = FirebaseAuth.instance.currentUser,
    );
  }

  void logOut() {
    _controller.add(AuthStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
