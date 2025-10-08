import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository_firebase_impl.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepository = AuthRepositoryFirebaseImpl();

  AuthBloc() : super(AuthStateLoading()) {
    on<CheckUserLoggedEvent>(_onCheckUserLoggedEvent);
  }
  FutureOr<void> _onCheckUserLoggedEvent(
    CheckUserLoggedEvent event,
    Emitter<AuthState> emit,
  ) {
    return emit.forEach(
      _authRepository.currentUser,
      onData: (data) {
        debugPrint(data.toString());
        if (data == null) {
          return AuthStateLoggedOut();
        }
        return AuthStateLoggedIn();
      },
    );
  }
}
