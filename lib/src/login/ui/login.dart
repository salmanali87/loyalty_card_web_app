import 'package:flutter/material.dart';
import 'package:loyalty_card_web_app/src/auth/bloc/auth_bloc.dart';
import 'package:loyalty_card_web_app/src/auth/repo/auth_repo.dart';
import 'package:loyalty_card_web_app/src/login/bloc/login_bloc.dart';
import 'package:loyalty_card_web_app/src/login/ui/login_form.dart';
import 'package:loyalty_card_web_app/src/dashboard/ui/dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepository: context.read<AuthRepository>(),
      ),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: size.width * 0.3,
                  height: size.height * 0.6,
                  decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)))),
              Container(
                width: size.width * 0.3,
                height: size.height * 0.6,
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                padding: const EdgeInsets.all(20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LogIn",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    LoginForm()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
