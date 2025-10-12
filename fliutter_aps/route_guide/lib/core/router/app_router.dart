import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:route_guide/core/app/bloc/app_bloc.dart';
import 'package:route_guide/core/app/handlers/app_handler.dart';
import 'package:route_guide/core/app/handlers/cubit/permission_cubit.dart';
import 'package:route_guide/core/router/app_routes.dart';

class AppRouter {
  static late GoRouter _router;
  static GoRouter get instance => _router;
  static void go(String location, {Object? extra}) {
    _router.go(location, extra: extra);
  }

  static void initialize(AppBloc appBloc, PermissionCubit permissionCubit) {
    _router = GoRouter(
      navigatorKey: rootNavigatorKey,
      refreshListenable: AppChangeNotifier(appBloc, permissionCubit),
      initialLocation: AppRoutes.main,
      routes: [buildAppRoutesShellRoute()],
      redirect: (context, state) {
        final currentLocation = state.uri.path;
        final isAppBooting = appBloc.state.loading;
        final isPermChecking = permissionCubit.state.checking;
        final permissionState = permissionCubit.state;
        final userExist = context.read<AppBloc>().state.userExists;
        debugPrint(
          'ROUTER userExist: $userExist, currentLocation:$currentLocation',
        );
        if (isAppBooting || isPermChecking) {
          return (currentLocation == AppRoutes.loading)
              ? null
              : AppRoutes.loading;
        }

        if (permissionState.ubicacion == PermissionStatus.denied ||
            permissionState.ubicacion == PermissionStatus.permanentlyDenied) {
          return AppRoutes.requestPermissions;
        } else {
          if (userExist) {
            return AppRoutes.map;
          }
        }
        return null;
      },
    );
  }
}
