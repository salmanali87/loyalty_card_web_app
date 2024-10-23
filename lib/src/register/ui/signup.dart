import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_card_web_app/src/auth/repo/auth_repo.dart';
import 'package:loyalty_card_web_app/src/login/ui/login_form.dart';
import 'package:loyalty_card_web_app/src/register/bloc/register_bloc.dart';
import 'package:loyalty_card_web_app/src/register/repo/register_repo.dart';
import 'package:loyalty_card_web_app/src/register/ui/signup_form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final RegistrationRepository _registerRepository;

  @override
  void initState() {
    super.initState();
    _registerRepository = RegistrationRepository();
  }

  @override
  void dispose() {
    _registerRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterBloc(
          registerRepository: _registerRepository,
          authRepository: context.read<AuthRepository>()),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.3,
                height: size.height,
                color: Colors.orange,
              ),
              Container(
                width: size.width * 0.3,
                height: size.height,
                color: Colors.amber,
                child: const Column(
                  children: [Text("Sig Up"), SignupForm()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
