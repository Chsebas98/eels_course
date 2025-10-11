// app_routes.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_guide/packages/features/onboarding/onboarding.dart';
import '../app/di/injection_repositories.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class OnBoardingRoutes {
  static const main = '/onboarding';
  static const info = 'information'; // ¡RELATIVO, sin slash!
  static const infoFull =
      '/onboarding/information'; // absoluto para navegar fácil
}

ShellRoute buildOnboardingShellRoute() => ShellRoute(
  builder: (context, state, child) {
    return BlocProvider(
      create: (_) => serviceLocator<OnBoardingBloc>(),
      child: child, // ← el hijo (rutas internas) hereda el Bloc
    );
  },
  routes: [
    GoRoute(
      path: OnBoardingRoutes.main,
      name: 'onboarding',
      builder: (context, state) => const OnBoardingPage(),
      routes: [
        GoRoute(
          path: OnBoardingRoutes.info, // relativo
          name: 'onboarding_information',
          builder: (context, state) => const InformationPage(),
        ),
      ],
    ),
  ],
);
