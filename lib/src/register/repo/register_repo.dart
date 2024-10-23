import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

enum RegistrationStatus { unknown, registered, unregistered }

class RegistrationRepository {
  final _auth = FirebaseAuth.instance;
  final _controller = StreamController<RegistrationStatus>();

  Stream<RegistrationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield RegistrationStatus.unregistered;
    yield* _controller.stream;
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _controller.add(RegistrationStatus.registered);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      _controller.add(RegistrationStatus.unregistered);
    }
  }

  Future<void> registerProfileInfo({
    required String userId,
    required String firstName,
    required String lastName,
    required String phoneNo,
    required String companyName,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(RegistrationStatus.registered),
    );
  }

  void dispose() => _controller.close();
}
