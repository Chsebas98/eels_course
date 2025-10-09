import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository_firebase_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  final _authRepositoryFirebaseImpl = AuthRepositoryFirebaseImpl();
  FutureOr<void> logoutEvent() async {
    await _authRepositoryFirebaseImpl.logOut();
  }
}
