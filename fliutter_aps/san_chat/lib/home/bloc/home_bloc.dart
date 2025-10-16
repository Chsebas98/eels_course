import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/data/domain/models/contact_model.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository_firebase_impl.dart';
import 'package:san_chat/data/repositories/contacts_repository/contacts_repository_impl.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _authRepositoryFirebaseImpl = AuthRepositoryFirebaseImpl();
  final _contactRepository = ContactsRepositoryImpl();

  HomeBloc() : super(HomeState()) {
    on<GetContactsEvent>(_onGetContactsEvent);
    on<UpdateContactsEvent>(_onUpdateContactsEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }

  FutureOr<void> _onGetContactsEvent(
    GetContactsEvent event,
    Emitter<HomeState> emit,
  ) async {
    // debugPrint("CONTACTOS ${_contactRepository.getUsers().toString()}");
    return emit.forEach(
      _contactRepository.getUsers(),
      onData: (data) {
        return state.copyWith(listaContactos: data);
      },
    );
  }

  FutureOr<void> _onLogoutEvent(
    LogoutEvent event,
    Emitter<HomeState> emit,
  ) async {
    final user = await _authRepositoryFirebaseImpl.currentUser.first;
    if (user == null) return;
    _contactRepository.updateUserStatus(user, false);

    await _authRepositoryFirebaseImpl.logOut();
  }

  FutureOr<void> _onUpdateContactsEvent(
    UpdateContactsEvent event,
    Emitter<HomeState> emit,
  ) async {
    final user = await _authRepositoryFirebaseImpl.currentUser.first;
    if (user == null) return;
    _contactRepository.updateUserStatus(user, event.status);
  }
}
