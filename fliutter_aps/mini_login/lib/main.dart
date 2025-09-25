import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_login/application/login-bloc/login_bloc.dart';
import 'package:mini_login/screens/home_screen.dart';
import 'package:mini_login/screens/login_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        navigatorKey: navigatorKey,
        routes: {
          '/login': (_) => const LoginScreen(),
          '/home': (_) => const HomeScreen(),
        },
        builder: (context, child) {
          return BlocListener<LoginBloc, LoginState>(
            listenWhen: (prev, current) =>
                current is LoginAuthenticated || current is LoginInitial,
            listener: (context, state) {
              debugPrint('state $state navigator ${navigatorKey.currentState}');
              if (state is LoginAuthenticated) {
                navigatorKey.currentState!.pushReplacementNamed('/home');
              } else if (state is LoginInitial) {
                navigatorKey.currentState!.pushReplacementNamed('/login');
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
