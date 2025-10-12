import 'dart:async';

import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:route_guide/core/app/bloc/app_bloc.dart';
import 'package:route_guide/core/app/handlers/cubit/permission_cubit.dart';

class AppChangeNotifier extends ChangeNotifier {
  final AppBloc _appBloc;
  final PermissionCubit _permissionCubit;

  late final StreamSubscription _appSub, _permSub;
  AppChangeNotifier(this._appBloc, this._permissionCubit) {
    _appSub = _appBloc.stream.distinct().listen((_) => notifyListeners());
    _permSub = _permissionCubit.stream.distinct().listen(
      (_) => notifyListeners(),
    );
  }
  @override
  void dispose() {
    _appSub.cancel();
    _permSub.cancel();
    super.dispose();
  }
}
