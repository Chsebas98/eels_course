// app_routes.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_guide/packages/features/maps/pages/maps_page.dart';
import 'package:route_guide/packages/features/onboarding/onboarding.dart';
import 'package:route_guide/packages/features/onboarding/pages/request_permission_page.dart';
import 'package:route_guide/packages/pages/loading_page.dart';
import '../app/di/injection_repositories.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static const loading = '/onboarding';
  static const main = '/onboarding';
  static const infoRelative = 'information';
  static const infoFull = '/onboarding/information';
  static const map = '/map-view';
  static const requestPermissions = '/req-permissions';
}

ShellRoute buildAppRoutesShellRoute() => ShellRoute(
  builder: (context, state, child) {
    return BlocProvider(
      create: (_) => serviceLocator<OnBoardingBloc>(),
      child: child, // ← el hijo (rutas internas) hereda el Bloc
    );
  },
  routes: [
    GoRoute(
      path: AppRoutes.loading,
      name: 'loading',
      builder: (_, __) => LoadingPage(),
    ),
    GoRoute(
      path: AppRoutes.main,
      name: 'onboarding',
      builder: (context, state) => const OnBoardingPage(),
      routes: [
        GoRoute(
          path: AppRoutes.infoRelative,
          name: 'onboarding_information',
          builder: (context, state) => const InformationPage(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.requestPermissions,
      name: 'req-permisos',
      builder: (context, state) => RequestPermissionPage(),
    ),
    GoRoute(
      path: AppRoutes.map,
      name: 'map',
      builder: (context, state) => MapsPage(),
    ),
  ],
);
