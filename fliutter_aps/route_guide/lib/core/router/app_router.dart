import 'package:go_router/go_router.dart';
import 'package:route_guide/core/router/app_routes.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: OnBoardingRoutes.main,
  routes: [buildOnboardingShellRoute()],
);
