import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_guide/packages/data/account/app/check_user_exists.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._checkUserExists) : super(const AppState()) {
    on<CheckExistUserEvent>(_onCheckExistUserEvent);
  }

  final CheckUserExists _checkUserExists;

  FutureOr<void> _onCheckExistUserEvent(
    CheckExistUserEvent event,
    Emitter<AppState> emit,
  ) async {
    return emit.forEach(
      _checkUserExists(),
      onData: (data) {
        debugPrint("RES: $data");
        return state.copyWith(userExists: data, loading: false);
      },
    );
  }
}
