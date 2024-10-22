import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthRepository {


  final _controller = StreamController<AuthStatus>();
  User? _user;

  AuthRepository(){
    print("object created");
  }


  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    print("login");
    await Future.delayed(
      const Duration(milliseconds: 300),
      () {
        _controller.add(AuthStatus.authenticated);
        print("login added");
      }
    );
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
