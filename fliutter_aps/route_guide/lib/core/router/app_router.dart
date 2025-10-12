import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:route_guide/core/app/bloc/app_bloc.dart';
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
      redirect: (context, state) {
        final currentLocation = state.uri.path;
        final permissionState = permissionCubit.state;
        final userExist = context.read<AppBloc>().state.userExists;
        debugPrint(
          'ROUTER userExist: $userExist, currentLocation:$currentLocation',
        );
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
      initialLocation: AppRoutes.main,
      routes: [buildAppRoutesShellRoute()],
    );
  }
}

class AppChangeNotifier extends ChangeNotifier {
  final AppBloc _appBloc;
  final PermissionCubit _permissionCubit;

  AppChangeNotifier(this._appBloc, this._permissionCubit) {
    _appBloc.stream.distinct().listen((_) {
      notifyListeners();
    });
    _permissionCubit.stream.distinct().listen((_) => notifyListeners());
  }
}
