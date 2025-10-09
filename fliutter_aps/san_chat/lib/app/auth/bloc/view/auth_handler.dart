import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/app/auth/bloc/auth_bloc.dart';
import 'package:san_chat/app/core/ui/ui.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({
    super.key,
    required this.navigatorKey,
    required this.child,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckUserLoggedEvent()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state) {
            case AuthStateLoggedIn():
              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                AppNavigator.home,
                (route) => false,
              );
              break;
            case AuthStateLoggedOut():
              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                AppNavigator.onBoarding,
                (route) => false,
              );
              // Navigator.pushNamed(context, AppNavigator.main);
              break;
            default:
          }
        },
        child: child,
      ),
    );
  }
}
