import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_card_web_app/src/auth/bloc/auth_bloc.dart';
import 'package:loyalty_card_web_app/src/auth/repo/auth_repo.dart';
import 'package:loyalty_card_web_app/src/dashboard/ui/dashboard.dart';
import 'package:loyalty_card_web_app/src/landing_page/ui/landing_page.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  late final AuthRepository _authRepository;

  @override
  void initState() {
    super.initState();
    _authRepository = AuthRepository();
  }

  @override
  void dispose() {
    _authRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => _authRepository,
      child: BlocProvider(
          lazy: false,
          create: (_) => AuthBloc(authRepository: _authRepository)..add(CheckLoggedInRequested()),
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            builder: (context, child) {
              return BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  print(state);
                  print(state.status);
                  switch (state.status) {
                    case AuthStatus.authenticated || AuthStatus.unknown:
                      _navigator.pushAndRemoveUntil<void>(
                        MaterialPageRoute<void>(
                            builder: (_) => const Dashboard()),
                        (route) => false,
                      );
                    case AuthStatus.unauthenticated:
                      _navigator.pushAndRemoveUntil<void>(
                        MaterialPageRoute<void>(
                            builder: (_) => const LandingPage()),
                        (route) => false,
                      );
                    case AuthStatus.unknown:
                      break;
                  }
                },
                child: child,
              );
            },
            onGenerateRoute: (_) =>
                MaterialPageRoute<void>(builder: (_) => const LandingPage()),
          )),
    );
  }
}
